/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x8ef4fb42 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
extern char *IEEE_P_2592010699;
extern char *STD_STANDARD;
static const char *ng2 = "C:/Users/jerem/OneDrive/Desktop/projects/blowfish/key_evaluator.vhd";



unsigned char work_a_0995837720_3212880686_sub_3322187839_3057020925(char *t1, char *t2, char *t3)
{
    char t4[144];
    char t5[16];
    char t18[16];
    char t35[8];
    unsigned char t0;
    char *t6;
    unsigned int t7;
    int t8;
    int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    char *t13;
    unsigned int t14;
    int t15;
    int t16;
    unsigned int t17;
    char *t19;
    unsigned int t20;
    int t21;
    char *t22;
    char *t23;
    int t24;
    unsigned int t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;
    char *t34;
    char *t36;
    char *t37;
    char *t38;
    unsigned char t39;
    char *t40;
    char *t41;
    char *t42;
    char *t43;
    unsigned int t44;
    unsigned char t45;
    unsigned int t46;
    char *t47;
    char *t48;
    char *t49;
    char *t50;

LAB0:    t6 = (t3 + 12U);
    t7 = *((unsigned int *)t6);
    t8 = (t7 - 1);
    t9 = (0 - t8);
    t10 = (t9 * -1);
    t10 = (t10 + 1);
    t10 = (t10 * 1U);
    t11 = xsi_get_transient_memory(t10);
    memset(t11, 0, t10);
    t12 = t11;
    memset(t12, (unsigned char)2, t10);
    t13 = (t3 + 12U);
    t14 = *((unsigned int *)t13);
    t15 = (t14 - 1);
    t16 = (0 - t15);
    t17 = (t16 * -1);
    t17 = (t17 + 1);
    t17 = (t17 * 1U);
    t19 = (t3 + 12U);
    t20 = *((unsigned int *)t19);
    t21 = (t20 - 1);
    t22 = (t18 + 0U);
    t23 = (t22 + 0U);
    *((int *)t23) = t21;
    t23 = (t22 + 4U);
    *((int *)t23) = 0;
    t23 = (t22 + 8U);
    *((int *)t23) = -1;
    t24 = (0 - t21);
    t25 = (t24 * -1);
    t25 = (t25 + 1);
    t23 = (t22 + 12U);
    *((unsigned int *)t23) = t25;
    t23 = (t4 + 4U);
    t26 = ((IEEE_P_2592010699) + 2332);
    t27 = (t23 + 52U);
    *((char **)t27) = t26;
    t28 = (char *)alloca(t17);
    t29 = (t23 + 36U);
    *((char **)t29) = t28;
    memcpy(t28, t11, t17);
    t30 = (t23 + 40U);
    *((char **)t30) = t18;
    t31 = (t23 + 48U);
    *((unsigned int *)t31) = t17;
    t32 = (t4 + 72U);
    t33 = ((STD_STANDARD) + 0);
    t34 = (t32 + 52U);
    *((char **)t34) = t33;
    t36 = (t32 + 36U);
    *((char **)t36) = t35;
    xsi_type_set_default_value(t33, t35, 0);
    t37 = (t32 + 48U);
    *((unsigned int *)t37) = 1U;
    t38 = (t5 + 4U);
    t39 = (t2 != 0);
    if (t39 == 1)
        goto LAB3;

LAB2:    t40 = (t5 + 8U);
    *((char **)t40) = t3;
    t41 = (t3 + 12U);
    t25 = *((unsigned int *)t41);
    t25 = (t25 * 1U);
    t42 = (t23 + 36U);
    t43 = *((char **)t42);
    t42 = (t18 + 12U);
    t44 = *((unsigned int *)t42);
    t44 = (t44 * 1U);
    t45 = 1;
    if (t25 == t44)
        goto LAB7;

LAB8:    t45 = 0;

LAB9:    if (t45 != 0)
        goto LAB4;

LAB6:    t6 = (t32 + 36U);
    t11 = *((char **)t6);
    t6 = (t11 + 0);
    *((unsigned char *)t6) = (unsigned char)1;

LAB5:    t6 = (t32 + 36U);
    t11 = *((char **)t6);
    t39 = *((unsigned char *)t11);
    t0 = t39;

LAB1:    return t0;
LAB3:    *((char **)t38) = t2;
    goto LAB2;

LAB4:    t49 = (t32 + 36U);
    t50 = *((char **)t49);
    t49 = (t50 + 0);
    *((unsigned char *)t49) = (unsigned char)0;
    goto LAB5;

LAB7:    t46 = 0;

LAB10:    if (t46 < t25)
        goto LAB11;
    else
        goto LAB9;

LAB11:    t47 = (t2 + t46);
    t48 = (t43 + t46);
    if (*((unsigned char *)t47) != *((unsigned char *)t48))
        goto LAB8;

LAB12:    t46 = (t46 + 1);
    goto LAB10;

LAB13:;
}

int work_a_0995837720_3212880686_sub_784602511_3057020925(char *t1, char *t2)
{
    char t3[72];
    char t4[16];
    char t5[16];
    char t12[8];
    char t23[16];
    int t0;
    char *t6;
    char *t7;
    int t8;
    unsigned int t9;
    char *t10;
    char *t11;
    char *t13;
    char *t14;
    char *t15;
    unsigned char t16;
    char *t17;
    char *t18;
    int t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    char *t24;
    char *t25;
    int t26;
    unsigned int t27;
    unsigned char t28;
    char *t29;

LAB0:    t6 = (t5 + 0U);
    t7 = (t6 + 0U);
    *((int *)t7) = 447;
    t7 = (t6 + 4U);
    *((int *)t7) = 0;
    t7 = (t6 + 8U);
    *((int *)t7) = -1;
    t8 = (0 - 447);
    t9 = (t8 * -1);
    t9 = (t9 + 1);
    t7 = (t6 + 12U);
    *((unsigned int *)t7) = t9;
    t7 = (t3 + 4U);
    t10 = ((STD_STANDARD) + 240);
    t11 = (t7 + 52U);
    *((char **)t11) = t10;
    t13 = (t7 + 36U);
    *((char **)t13) = t12;
    xsi_type_set_default_value(t10, t12, 0);
    t14 = (t7 + 48U);
    *((unsigned int *)t14) = 4U;
    t15 = (t4 + 4U);
    t16 = (t2 != 0);
    if (t16 == 1)
        goto LAB3;

LAB2:    t17 = (t4 + 8U);
    *((char **)t17) = t5;
    t18 = (t5 + 0U);
    t19 = *((int *)t18);
    t9 = (t19 - 447);
    t20 = (t9 * 1U);
    t21 = (0 + t20);
    t22 = (t2 + t21);
    t24 = (t23 + 0U);
    t25 = (t24 + 0U);
    *((int *)t25) = 447;
    t25 = (t24 + 4U);
    *((int *)t25) = 416;
    t25 = (t24 + 8U);
    *((int *)t25) = -1;
    t26 = (416 - 447);
    t27 = (t26 * -1);
    t27 = (t27 + 1);
    t25 = (t24 + 12U);
    *((unsigned int *)t25) = t27;
    t28 = work_a_0995837720_3212880686_sub_3322187839_3057020925(t1, t22, t23);
    if (t28 != 0)
        goto LAB4;

LAB6:    t6 = (t5 + 0U);
    t8 = *((int *)t6);
    t9 = (t8 - 415);
    t20 = (t9 * 1U);
    t21 = (0 + t20);
    t10 = (t2 + t21);
    t11 = (t23 + 0U);
    t13 = (t11 + 0U);
    *((int *)t13) = 415;
    t13 = (t11 + 4U);
    *((int *)t13) = 384;
    t13 = (t11 + 8U);
    *((int *)t13) = -1;
    t19 = (384 - 415);
    t27 = (t19 * -1);
    t27 = (t27 + 1);
    t13 = (t11 + 12U);
    *((unsigned int *)t13) = t27;
    t16 = work_a_0995837720_3212880686_sub_3322187839_3057020925(t1, t10, t23);
    if (t16 != 0)
        goto LAB7;

LAB8:    t6 = (t5 + 0U);
    t8 = *((int *)t6);
    t9 = (t8 - 383);
    t20 = (t9 * 1U);
    t21 = (0 + t20);
    t10 = (t2 + t21);
    t11 = (t23 + 0U);
    t13 = (t11 + 0U);
    *((int *)t13) = 383;
    t13 = (t11 + 4U);
    *((int *)t13) = 352;
    t13 = (t11 + 8U);
    *((int *)t13) = -1;
    t19 = (352 - 383);
    t27 = (t19 * -1);
    t27 = (t27 + 1);
    t13 = (t11 + 12U);
    *((unsigned int *)t13) = t27;
    t16 = work_a_0995837720_3212880686_sub_3322187839_3057020925(t1, t10, t23);
    if (t16 != 0)
        goto LAB9;

LAB10:    t6 = (t5 + 0U);
    t8 = *((int *)t6);
    t9 = (t8 - 351);
    t20 = (t9 * 1U);
    t21 = (0 + t20);
    t10 = (t2 + t21);
    t11 = (t23 + 0U);
    t13 = (t11 + 0U);
    *((int *)t13) = 351;
    t13 = (t11 + 4U);
    *((int *)t13) = 320;
    t13 = (t11 + 8U);
    *((int *)t13) = -1;
    t19 = (320 - 351);
    t27 = (t19 * -1);
    t27 = (t27 + 1);
    t13 = (t11 + 12U);
    *((unsigned int *)t13) = t27;
    t16 = work_a_0995837720_3212880686_sub_3322187839_3057020925(t1, t10, t23);
    if (t16 != 0)
        goto LAB11;

LAB12:    t6 = (t5 + 0U);
    t8 = *((int *)t6);
    t9 = (t8 - 319);
    t20 = (t9 * 1U);
    t21 = (0 + t20);
    t10 = (t2 + t21);
    t11 = (t23 + 0U);
    t13 = (t11 + 0U);
    *((int *)t13) = 319;
    t13 = (t11 + 4U);
    *((int *)t13) = 288;
    t13 = (t11 + 8U);
    *((int *)t13) = -1;
    t19 = (288 - 319);
    t27 = (t19 * -1);
    t27 = (t27 + 1);
    t13 = (t11 + 12U);
    *((unsigned int *)t13) = t27;
    t16 = work_a_0995837720_3212880686_sub_3322187839_3057020925(t1, t10, t23);
    if (t16 != 0)
        goto LAB13;

LAB14:    t6 = (t5 + 0U);
    t8 = *((int *)t6);
    t9 = (t8 - 287);
    t20 = (t9 * 1U);
    t21 = (0 + t20);
    t10 = (t2 + t21);
    t11 = (t23 + 0U);
    t13 = (t11 + 0U);
    *((int *)t13) = 287;
    t13 = (t11 + 4U);
    *((int *)t13) = 256;
    t13 = (t11 + 8U);
    *((int *)t13) = -1;
    t19 = (256 - 287);
    t27 = (t19 * -1);
    t27 = (t27 + 1);
    t13 = (t11 + 12U);
    *((unsigned int *)t13) = t27;
    t16 = work_a_0995837720_3212880686_sub_3322187839_3057020925(t1, t10, t23);
    if (t16 != 0)
        goto LAB15;

LAB16:    t6 = (t5 + 0U);
    t8 = *((int *)t6);
    t9 = (t8 - 255);
    t20 = (t9 * 1U);
    t21 = (0 + t20);
    t10 = (t2 + t21);
    t11 = (t23 + 0U);
    t13 = (t11 + 0U);
    *((int *)t13) = 255;
    t13 = (t11 + 4U);
    *((int *)t13) = 224;
    t13 = (t11 + 8U);
    *((int *)t13) = -1;
    t19 = (224 - 255);
    t27 = (t19 * -1);
    t27 = (t27 + 1);
    t13 = (t11 + 12U);
    *((unsigned int *)t13) = t27;
    t16 = work_a_0995837720_3212880686_sub_3322187839_3057020925(t1, t10, t23);
    if (t16 != 0)
        goto LAB17;

LAB18:    t6 = (t5 + 0U);
    t8 = *((int *)t6);
    t9 = (t8 - 223);
    t20 = (t9 * 1U);
    t21 = (0 + t20);
    t10 = (t2 + t21);
    t11 = (t23 + 0U);
    t13 = (t11 + 0U);
    *((int *)t13) = 223;
    t13 = (t11 + 4U);
    *((int *)t13) = 192;
    t13 = (t11 + 8U);
    *((int *)t13) = -1;
    t19 = (192 - 223);
    t27 = (t19 * -1);
    t27 = (t27 + 1);
    t13 = (t11 + 12U);
    *((unsigned int *)t13) = t27;
    t16 = work_a_0995837720_3212880686_sub_3322187839_3057020925(t1, t10, t23);
    if (t16 != 0)
        goto LAB19;

LAB20:    t6 = (t5 + 0U);
    t8 = *((int *)t6);
    t9 = (t8 - 191);
    t20 = (t9 * 1U);
    t21 = (0 + t20);
    t10 = (t2 + t21);
    t11 = (t23 + 0U);
    t13 = (t11 + 0U);
    *((int *)t13) = 191;
    t13 = (t11 + 4U);
    *((int *)t13) = 160;
    t13 = (t11 + 8U);
    *((int *)t13) = -1;
    t19 = (160 - 191);
    t27 = (t19 * -1);
    t27 = (t27 + 1);
    t13 = (t11 + 12U);
    *((unsigned int *)t13) = t27;
    t16 = work_a_0995837720_3212880686_sub_3322187839_3057020925(t1, t10, t23);
    if (t16 != 0)
        goto LAB21;

LAB22:    t6 = (t5 + 0U);
    t8 = *((int *)t6);
    t9 = (t8 - 159);
    t20 = (t9 * 1U);
    t21 = (0 + t20);
    t10 = (t2 + t21);
    t11 = (t23 + 0U);
    t13 = (t11 + 0U);
    *((int *)t13) = 159;
    t13 = (t11 + 4U);
    *((int *)t13) = 128;
    t13 = (t11 + 8U);
    *((int *)t13) = -1;
    t19 = (128 - 159);
    t27 = (t19 * -1);
    t27 = (t27 + 1);
    t13 = (t11 + 12U);
    *((unsigned int *)t13) = t27;
    t16 = work_a_0995837720_3212880686_sub_3322187839_3057020925(t1, t10, t23);
    if (t16 != 0)
        goto LAB23;

LAB24:    t6 = (t5 + 0U);
    t8 = *((int *)t6);
    t9 = (t8 - 127);
    t20 = (t9 * 1U);
    t21 = (0 + t20);
    t10 = (t2 + t21);
    t11 = (t23 + 0U);
    t13 = (t11 + 0U);
    *((int *)t13) = 127;
    t13 = (t11 + 4U);
    *((int *)t13) = 96;
    t13 = (t11 + 8U);
    *((int *)t13) = -1;
    t19 = (96 - 127);
    t27 = (t19 * -1);
    t27 = (t27 + 1);
    t13 = (t11 + 12U);
    *((unsigned int *)t13) = t27;
    t16 = work_a_0995837720_3212880686_sub_3322187839_3057020925(t1, t10, t23);
    if (t16 != 0)
        goto LAB25;

LAB26:    t6 = (t5 + 0U);
    t8 = *((int *)t6);
    t9 = (t8 - 95);
    t20 = (t9 * 1U);
    t21 = (0 + t20);
    t10 = (t2 + t21);
    t11 = (t23 + 0U);
    t13 = (t11 + 0U);
    *((int *)t13) = 95;
    t13 = (t11 + 4U);
    *((int *)t13) = 64;
    t13 = (t11 + 8U);
    *((int *)t13) = -1;
    t19 = (64 - 95);
    t27 = (t19 * -1);
    t27 = (t27 + 1);
    t13 = (t11 + 12U);
    *((unsigned int *)t13) = t27;
    t16 = work_a_0995837720_3212880686_sub_3322187839_3057020925(t1, t10, t23);
    if (t16 != 0)
        goto LAB27;

LAB28:    t6 = (t5 + 0U);
    t8 = *((int *)t6);
    t9 = (t8 - 63);
    t20 = (t9 * 1U);
    t21 = (0 + t20);
    t10 = (t2 + t21);
    t11 = (t23 + 0U);
    t13 = (t11 + 0U);
    *((int *)t13) = 63;
    t13 = (t11 + 4U);
    *((int *)t13) = 32;
    t13 = (t11 + 8U);
    *((int *)t13) = -1;
    t19 = (32 - 63);
    t27 = (t19 * -1);
    t27 = (t27 + 1);
    t13 = (t11 + 12U);
    *((unsigned int *)t13) = t27;
    t16 = work_a_0995837720_3212880686_sub_3322187839_3057020925(t1, t10, t23);
    if (t16 != 0)
        goto LAB29;

LAB30:    t6 = (t7 + 36U);
    t10 = *((char **)t6);
    t6 = (t10 + 0);
    *((int *)t6) = 1;

LAB5:    t6 = (t7 + 36U);
    t10 = *((char **)t6);
    t8 = *((int *)t10);
    t0 = t8;

LAB1:    return t0;
LAB3:    *((char **)t15) = t2;
    goto LAB2;

LAB4:    t25 = (t7 + 36U);
    t29 = *((char **)t25);
    t25 = (t29 + 0);
    *((int *)t25) = 14;
    goto LAB5;

LAB7:    t13 = (t7 + 36U);
    t14 = *((char **)t13);
    t13 = (t14 + 0);
    *((int *)t13) = 13;
    goto LAB5;

LAB9:    t13 = (t7 + 36U);
    t14 = *((char **)t13);
    t13 = (t14 + 0);
    *((int *)t13) = 12;
    goto LAB5;

LAB11:    t13 = (t7 + 36U);
    t14 = *((char **)t13);
    t13 = (t14 + 0);
    *((int *)t13) = 11;
    goto LAB5;

LAB13:    t13 = (t7 + 36U);
    t14 = *((char **)t13);
    t13 = (t14 + 0);
    *((int *)t13) = 10;
    goto LAB5;

LAB15:    t13 = (t7 + 36U);
    t14 = *((char **)t13);
    t13 = (t14 + 0);
    *((int *)t13) = 9;
    goto LAB5;

LAB17:    t13 = (t7 + 36U);
    t14 = *((char **)t13);
    t13 = (t14 + 0);
    *((int *)t13) = 8;
    goto LAB5;

LAB19:    t13 = (t7 + 36U);
    t14 = *((char **)t13);
    t13 = (t14 + 0);
    *((int *)t13) = 7;
    goto LAB5;

LAB21:    t13 = (t7 + 36U);
    t14 = *((char **)t13);
    t13 = (t14 + 0);
    *((int *)t13) = 6;
    goto LAB5;

LAB23:    t13 = (t7 + 36U);
    t14 = *((char **)t13);
    t13 = (t14 + 0);
    *((int *)t13) = 5;
    goto LAB5;

LAB25:    t13 = (t7 + 36U);
    t14 = *((char **)t13);
    t13 = (t14 + 0);
    *((int *)t13) = 4;
    goto LAB5;

LAB27:    t13 = (t7 + 36U);
    t14 = *((char **)t13);
    t13 = (t14 + 0);
    *((int *)t13) = 3;
    goto LAB5;

LAB29:    t13 = (t7 + 36U);
    t14 = *((char **)t13);
    t13 = (t14 + 0);
    *((int *)t13) = 2;
    goto LAB5;

LAB31:;
}

static void work_a_0995837720_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(96, ng2);

LAB3:    t1 = (t0 + 592U);
    t2 = *((char **)t1);
    t3 = work_a_0995837720_3212880686_sub_784602511_3057020925(t0, t2);
    t1 = (t0 + 1828);
    t4 = (t1 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    *((int *)t7) = t3;
    xsi_driver_first_trans_fast(t1);

LAB2:    t8 = (t0 + 1776);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0995837720_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(97, ng2);

LAB3:    t1 = (t0 + 776U);
    t2 = *((char **)t1);
    t3 = *((int *)t2);
    t1 = (t0 + 1864);
    t4 = (t1 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    *((int *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 1784);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_0995837720_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0995837720_3212880686_p_0,(void *)work_a_0995837720_3212880686_p_1};
	static char *se[] = {(void *)work_a_0995837720_3212880686_sub_3322187839_3057020925,(void *)work_a_0995837720_3212880686_sub_784602511_3057020925};
	xsi_register_didat("work_a_0995837720_3212880686", "isim/datapath1_isim_beh.exe.sim/work/a_0995837720_3212880686.didat");
	xsi_register_executes(pe);
	xsi_register_subprogram_executes(se);
}
