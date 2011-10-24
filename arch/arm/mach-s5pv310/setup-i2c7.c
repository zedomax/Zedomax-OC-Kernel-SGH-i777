/* linux/arch/arm/mach-s5pv310/setup-i2c7.c
 *
 * Copyright (c) 2009-2010 Samsung Electronics Co., Ltd.
 *		http://www.samsung.com/
 *
 * I2C7 GPIO configuration.
 *
 * Based on plat-s3c64xx/setup-i2c0.c
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
*/

#include <linux/kernel.h>
#include <linux/types.h>

struct platform_device; /* don't need the contents */

#include <mach/gpio.h>
#include <plat/iic.h>
#include <plat/gpio-cfg.h>

void s3c_i2c7_cfg_gpio(struct platform_device *dev)
{
	s3c_gpio_cfgpin(S5PV310_GPD0(2), S3C_GPIO_SFN(3));
	s3c_gpio_setpull(S5PV310_GPD0(2), S3C_GPIO_PULL_NONE);
	s3c_gpio_cfgpin(S5PV310_GPD0(3), S3C_GPIO_SFN(3));
	s3c_gpio_setpull(S5PV310_GPD0(3), S3C_GPIO_PULL_NONE);
}
