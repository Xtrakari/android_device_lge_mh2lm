/*
 * Copyright (C) 2022 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#define LOG_TAG "UdfpsHandler.mh2lm"

#include <android-base/file.h>
#include <hardware/fingerprint.h>
#include "UdfpsHandler.h"
#include "rbs_fingerprint.h"

#include <android-base/logging.h>

#define FOD_HBM_PATH "/sys/devices/virtual/panel/brightness/fp_lhbm"

static void setFodHbm(bool status) {
    android::base::WriteStringToFile(status ? "1" : "0", FOD_HBM_PATH);
}


class Mh2lmUdfpsHander : public UdfpsHandler {
  public:
    void init(rbs_fingerprint_device_t *device) {
        mDevice = device;
    }

    void onFingerDown(uint32_t /*x*/, uint32_t /*y*/, float /*minor*/, float /*major*/) {
        setFodHbm(true);
        notifyScanStart();
    }

    void onFingerUp() {
        setFodHbm(false);
        notifyScanStop();
    }

    void onAcquired(int32_t result, int32_t /*vendorCode*/) {
        if (result == FINGERPRINT_ACQUIRED_GOOD) {
            setFodHbm(false);
            notifyScanStop();
        }
    }

    void cancel() {
        setFodHbm(false);
        notifyScanStop();
    }

  private:

    void doExtraApi(uint32_t param) {
        uint32_t rbs_param[8] = {};
        uint32_t rbs_param_size = sizeof(rbs_param);
        mDevice->rbs_extra_api(7, &param, 4, rbs_param, &rbs_param_size);
    }

    void notifyScanStart(void) {
        doExtraApi(0x65);
    }

    void notifyScanStop(void) {
        doExtraApi(0x66);
    }

    rbs_fingerprint_device_t *mDevice;
};

static UdfpsHandler* create() {
    return new Mh2lmUdfpsHander();
}

static void destroy(UdfpsHandler* handler) {
    delete handler;
}

extern "C" UdfpsHandlerFactory UDFPS_HANDLER_FACTORY = {
    .create = create,
    .destroy = destroy,
};
