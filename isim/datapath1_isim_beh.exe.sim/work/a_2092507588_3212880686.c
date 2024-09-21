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
extern char *STD_STANDARD;
static const char *ng1 = "";
extern char *IEEE_P_1242562249;
static const char *ng3 = "C:/Users/jerem/OneDrive/Desktop/projects/blowfish/database.vhd";

int ieee_p_1242562249_sub_1657552908_1035706684(char *, char *, char *);


int work_a_2092507588_3212880686_sub_4093868711_3057020925(char *t1, char *t2)
{
    char t3[376];
    char t4[16];
    char t5[16];
    char t11[16];
    char t16[8];
    char t21[16];
    char t26[8];
    char t31[16];
    char t36[8];
    char t47[16];
    int t0;
    char *t6;
    char *t7;
    int t8;
    unsigned int t9;
    char *t10;
    char *t12;
    int t13;
    char *t14;
    char *t15;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t22;
    int t23;
    char *t24;
    char *t25;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t32;
    int t33;
    char *t34;
    char *t35;
    char *t37;
    char *t38;
    char *t39;
    unsigned char t40;
    char *t41;
    char *t42;
    int t43;
    unsigned int t44;
    unsigned int t45;
    char *t46;
    char *t48;
    char *t49;
    int t50;
    unsigned int t51;
    int t52;
    char *t53;

LAB0:    t6 = (t5 + 0U);
    t7 = (t6 + 0U);
    *((int *)t7) = 7;
    t7 = (t6 + 4U);
    *((int *)t7) = 0;
    t7 = (t6 + 8U);
    *((int *)t7) = -1;
    t8 = (0 - 7);
    t9 = (t8 * -1);
    t9 = (t9 + 1);
    t7 = (t6 + 12U);
    *((unsigned int *)t7) = t9;
    t7 = (t3 + 4U);
    t10 = ((STD_STANDARD) + 240);
    t12 = (t11 + 0U);
    *((int *)t12) = 0;
    t12 = (t11 + 4U);
    *((int *)t12) = 16;
    t12 = (t11 + 8U);
    *((int *)t12) = 1;
    t13 = (16 - 0);
    t9 = (t13 * 1);
    t9 = (t9 + 1);
    t12 = (t11 + 12U);
    *((unsigned int *)t12) = t9;
    t12 = (t3 + 72U);
    xsi_create_subtype(t12, ng1, t10, t11, 16);
    t14 = (t3 + 72U);
    t15 = (t7 + 52U);
    *((char **)t15) = t14;
    t17 = (t7 + 36U);
    *((char **)t17) = t16;
    xsi_type_set_default_value(t14, t16, 0);
    t18 = (t7 + 48U);
    *((unsigned int *)t18) = 4U;
    t19 = (t3 + 128U);
    t20 = ((STD_STANDARD) + 240);
    t22 = (t21 + 0U);
    *((int *)t22) = 0;
    t22 = (t21 + 4U);
    *((int *)t22) = 16;
    t22 = (t21 + 8U);
    *((int *)t22) = 1;
    t23 = (16 - 0);
    t9 = (t23 * 1);
    t9 = (t9 + 1);
    t22 = (t21 + 12U);
    *((unsigned int *)t22) = t9;
    t22 = (t3 + 196U);
    xsi_create_subtype(t22, ng1, t20, t21, 16);
    t24 = (t3 + 196U);
    t25 = (t19 + 52U);
    *((char **)t25) = t24;
    t27 = (t19 + 36U);
    *((char **)t27) = t26;
    xsi_type_set_default_value(t24, t26, 0);
    t28 = (t19 + 48U);
    *((unsigned int *)t28) = 4U;
    t29 = (t3 + 252U);
    t30 = ((STD_STANDARD) + 240);
    t32 = (t31 + 0U);
    *((int *)t32) = 0;
    t32 = (t31 + 4U);
    *((int *)t32) = 256;
    t32 = (t31 + 8U);
    *((int *)t32) = 1;
    t33 = (256 - 0);
    t9 = (t33 * 1);
    t9 = (t9 + 1);
    t32 = (t31 + 12U);
    *((unsigned int *)t32) = t9;
    t32 = (t3 + 320U);
    xsi_create_subtype(t32, ng1, t30, t31, 16);
    t34 = (t3 + 320U);
    t35 = (t29 + 52U);
    *((char **)t35) = t34;
    t37 = (t29 + 36U);
    *((char **)t37) = t36;
    xsi_type_set_default_value(t34, t36, 0);
    t38 = (t29 + 48U);
    *((unsigned int *)t38) = 4U;
    t39 = (t4 + 4U);
    t40 = (t2 != 0);
    if (t40 == 1)
        goto LAB3;

LAB2:    t41 = (t4 + 8U);
    *((char **)t41) = t5;
    t42 = (t5 + 0U);
    t43 = *((int *)t42);
    t9 = (t43 - 7);
    t44 = (t9 * 1U);
    t45 = (0 + t44);
    t46 = (t2 + t45);
    t48 = (t47 + 0U);
    t49 = (t48 + 0U);
    *((int *)t49) = 7;
    t49 = (t48 + 4U);
    *((int *)t49) = 4;
    t49 = (t48 + 8U);
    *((int *)t49) = -1;
    t50 = (4 - 7);
    t51 = (t50 * -1);
    t51 = (t51 + 1);
    t49 = (t48 + 12U);
    *((unsigned int *)t49) = t51;
    t52 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t46, t47);
    t49 = (t7 + 36U);
    t53 = *((char **)t49);
    t49 = (t53 + 0);
    *((int *)t49) = t52;
    t6 = (t5 + 0U);
    t8 = *((int *)t6);
    t9 = (t8 - 3);
    t44 = (t9 * 1U);
    t45 = (0 + t44);
    t10 = (t2 + t45);
    t12 = (t47 + 0U);
    t14 = (t12 + 0U);
    *((int *)t14) = 3;
    t14 = (t12 + 4U);
    *((int *)t14) = 0;
    t14 = (t12 + 8U);
    *((int *)t14) = -1;
    t13 = (0 - 3);
    t51 = (t13 * -1);
    t51 = (t51 + 1);
    t14 = (t12 + 12U);
    *((unsigned int *)t14) = t51;
    t23 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t10, t47);
    t14 = (t19 + 36U);
    t15 = *((char **)t14);
    t14 = (t15 + 0);
    *((int *)t14) = t23;
    t6 = (t7 + 36U);
    t10 = *((char **)t6);
    t8 = *((int *)t10);
    if (t8 == 0)
        goto LAB5;

LAB21:    if (t8 == 1)
        goto LAB6;

LAB22:    if (t8 == 2)
        goto LAB7;

LAB23:    if (t8 == 3)
        goto LAB8;

LAB24:    if (t8 == 4)
        goto LAB9;

LAB25:    if (t8 == 5)
        goto LAB10;

LAB26:    if (t8 == 6)
        goto LAB11;

LAB27:    if (t8 == 7)
        goto LAB12;

LAB28:    if (t8 == 8)
        goto LAB13;

LAB29:    if (t8 == 9)
        goto LAB14;

LAB30:    if (t8 == 10)
        goto LAB15;

LAB31:    if (t8 == 11)
        goto LAB16;

LAB32:    if (t8 == 12)
        goto LAB17;

LAB33:    if (t8 == 13)
        goto LAB18;

LAB34:    if (t8 == 14)
        goto LAB19;

LAB35:
LAB20:    t6 = (t19 + 36U);
    t10 = *((char **)t6);
    t8 = *((int *)t10);
    t13 = (240 + t8);
    t6 = (t29 + 36U);
    t12 = *((char **)t6);
    t6 = (t12 + 0);
    *((int *)t6) = t13;

LAB4:    t6 = (t29 + 36U);
    t10 = *((char **)t6);
    t8 = *((int *)t10);
    t0 = t8;

LAB1:    return t0;
LAB3:    *((char **)t39) = t2;
    goto LAB2;

LAB5:    t6 = (t19 + 36U);
    t12 = *((char **)t6);
    t13 = *((int *)t12);
    t23 = (0 + t13);
    t6 = (t29 + 36U);
    t14 = *((char **)t6);
    t6 = (t14 + 0);
    *((int *)t6) = t23;
    goto LAB4;

LAB6:    t6 = (t19 + 36U);
    t10 = *((char **)t6);
    t8 = *((int *)t10);
    t13 = (16 + t8);
    t6 = (t29 + 36U);
    t12 = *((char **)t6);
    t6 = (t12 + 0);
    *((int *)t6) = t13;
    goto LAB4;

LAB7:    t6 = (t19 + 36U);
    t10 = *((char **)t6);
    t8 = *((int *)t10);
    t13 = (32 + t8);
    t6 = (t29 + 36U);
    t12 = *((char **)t6);
    t6 = (t12 + 0);
    *((int *)t6) = t13;
    goto LAB4;

LAB8:    t6 = (t19 + 36U);
    t10 = *((char **)t6);
    t8 = *((int *)t10);
    t13 = (48 + t8);
    t6 = (t29 + 36U);
    t12 = *((char **)t6);
    t6 = (t12 + 0);
    *((int *)t6) = t13;
    goto LAB4;

LAB9:    t6 = (t19 + 36U);
    t10 = *((char **)t6);
    t8 = *((int *)t10);
    t13 = (64 + t8);
    t6 = (t29 + 36U);
    t12 = *((char **)t6);
    t6 = (t12 + 0);
    *((int *)t6) = t13;
    goto LAB4;

LAB10:    t6 = (t19 + 36U);
    t10 = *((char **)t6);
    t8 = *((int *)t10);
    t13 = (80 + t8);
    t6 = (t29 + 36U);
    t12 = *((char **)t6);
    t6 = (t12 + 0);
    *((int *)t6) = t13;
    goto LAB4;

LAB11:    t6 = (t19 + 36U);
    t10 = *((char **)t6);
    t8 = *((int *)t10);
    t13 = (96 + t8);
    t6 = (t29 + 36U);
    t12 = *((char **)t6);
    t6 = (t12 + 0);
    *((int *)t6) = t13;
    goto LAB4;

LAB12:    t6 = (t19 + 36U);
    t10 = *((char **)t6);
    t8 = *((int *)t10);
    t13 = (112 + t8);
    t6 = (t29 + 36U);
    t12 = *((char **)t6);
    t6 = (t12 + 0);
    *((int *)t6) = t13;
    goto LAB4;

LAB13:    t6 = (t19 + 36U);
    t10 = *((char **)t6);
    t8 = *((int *)t10);
    t13 = (128 + t8);
    t6 = (t29 + 36U);
    t12 = *((char **)t6);
    t6 = (t12 + 0);
    *((int *)t6) = t13;
    goto LAB4;

LAB14:    t6 = (t19 + 36U);
    t10 = *((char **)t6);
    t8 = *((int *)t10);
    t13 = (144 + t8);
    t6 = (t29 + 36U);
    t12 = *((char **)t6);
    t6 = (t12 + 0);
    *((int *)t6) = t13;
    goto LAB4;

LAB15:    t6 = (t19 + 36U);
    t10 = *((char **)t6);
    t8 = *((int *)t10);
    t13 = (160 + t8);
    t6 = (t29 + 36U);
    t12 = *((char **)t6);
    t6 = (t12 + 0);
    *((int *)t6) = t13;
    goto LAB4;

LAB16:    t6 = (t19 + 36U);
    t10 = *((char **)t6);
    t8 = *((int *)t10);
    t13 = (176 + t8);
    t6 = (t29 + 36U);
    t12 = *((char **)t6);
    t6 = (t12 + 0);
    *((int *)t6) = t13;
    goto LAB4;

LAB17:    t6 = (t19 + 36U);
    t10 = *((char **)t6);
    t8 = *((int *)t10);
    t13 = (192 + t8);
    t6 = (t29 + 36U);
    t12 = *((char **)t6);
    t6 = (t12 + 0);
    *((int *)t6) = t13;
    goto LAB4;

LAB18:    t6 = (t19 + 36U);
    t10 = *((char **)t6);
    t8 = *((int *)t10);
    t13 = (208 + t8);
    t6 = (t29 + 36U);
    t12 = *((char **)t6);
    t6 = (t12 + 0);
    *((int *)t6) = t13;
    goto LAB4;

LAB19:    t6 = (t19 + 36U);
    t10 = *((char **)t6);
    t8 = *((int *)t10);
    t13 = (224 + t8);
    t6 = (t29 + 36U);
    t12 = *((char **)t6);
    t6 = (t12 + 0);
    *((int *)t6) = t13;
    goto LAB4;

LAB36:;
LAB37:;
}

static void work_a_2092507588_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(174, ng3);

LAB3:    t1 = xsi_get_transient_memory(4U);
    memset(t1, 0, 4U);
    t2 = t1;
    memset(t2, (unsigned char)2, 4U);
    t3 = (t0 + 5432);
    t4 = (t3 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    memcpy(t7, t1, 4U);
    xsi_driver_first_trans_fast(t3);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_2092507588_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    int t5;
    char *t6;
    char *t7;
    int t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;

LAB0:    t1 = (t0 + 4432U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(179, ng3);
    t2 = (t0 + 1788U);
    t3 = *((char **)t2);
    t2 = (t0 + 10985);
    t5 = xsi_mem_cmp(t2, t3, 2U);
    if (t5 == 1)
        goto LAB5;

LAB8:    t6 = (t0 + 10987);
    t8 = xsi_mem_cmp(t6, t3, 2U);
    if (t8 == 1)
        goto LAB6;

LAB9:
LAB7:    xsi_set_current_line(180, ng3);
    t2 = (t0 + 592U);
    t3 = *((char **)t2);
    t15 = (63 - 31);
    t16 = (t15 * 1U);
    t17 = (0 + t16);
    t2 = (t3 + t17);
    t4 = (t0 + 5468);
    t6 = (t4 + 32U);
    t7 = *((char **)t6);
    t9 = (t7 + 40U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 32U);
    xsi_driver_first_trans_fast(t4);

LAB4:    xsi_set_current_line(179, ng3);

LAB13:    t2 = (t0 + 5348);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB14;

LAB1:    return;
LAB5:    xsi_set_current_line(180, ng3);
    t9 = (t0 + 1880U);
    t10 = *((char **)t9);
    t9 = (t0 + 5468);
    t11 = (t9 + 32U);
    t12 = *((char **)t11);
    t13 = (t12 + 40U);
    t14 = *((char **)t13);
    memcpy(t14, t10, 32U);
    xsi_driver_first_trans_fast(t9);
    goto LAB4;

LAB6:    xsi_set_current_line(180, ng3);
    t2 = (t0 + 592U);
    t3 = *((char **)t2);
    t15 = (63 - 63);
    t16 = (t15 * 1U);
    t17 = (0 + t16);
    t2 = (t3 + t17);
    t4 = (t0 + 5468);
    t6 = (t4 + 32U);
    t7 = *((char **)t6);
    t9 = (t7 + 40U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 32U);
    xsi_driver_first_trans_fast(t4);
    goto LAB4;

LAB10:;
LAB11:    t3 = (t0 + 5348);
    *((int *)t3) = 0;
    goto LAB2;

LAB12:    goto LAB11;

LAB14:    goto LAB12;

}

static void work_a_2092507588_3212880686_p_2(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    unsigned char t4;
    char *t5;
    char *t6;
    int t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    static char *nl0[] = {&&LAB6, &&LAB6, &&LAB5, &&LAB6, &&LAB6, &&LAB6, &&LAB6, &&LAB6, &&LAB6};

LAB0:    t1 = (t0 + 4576U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(185, ng3);
    t2 = (t0 + 1696U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t2 = (char *)((nl0) + t4);
    goto **((char **)t2);

LAB4:    xsi_set_current_line(185, ng3);

LAB9:    t2 = (t0 + 5356);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB10;

LAB1:    return;
LAB5:    xsi_set_current_line(186, ng3);
    t5 = (t0 + 1972U);
    t6 = *((char **)t5);
    t7 = *((int *)t6);
    t5 = (t0 + 5504);
    t8 = (t5 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    *((int *)t11) = t7;
    xsi_driver_first_trans_fast(t5);
    goto LAB4;

LAB6:    xsi_set_current_line(186, ng3);
    t2 = (t0 + 2064U);
    t3 = *((char **)t2);
    t12 = (31 - 7);
    t13 = (t12 * 1U);
    t14 = (0 + t13);
    t2 = (t3 + t14);
    t7 = work_a_2092507588_3212880686_sub_4093868711_3057020925(t0, t2);
    t5 = (t0 + 5504);
    t6 = (t5 + 32U);
    t8 = *((char **)t6);
    t9 = (t8 + 40U);
    t10 = *((char **)t9);
    *((int *)t10) = t7;
    xsi_driver_first_trans_fast(t5);
    goto LAB4;

LAB7:    t3 = (t0 + 5356);
    *((int *)t3) = 0;
    goto LAB2;

LAB8:    goto LAB7;

LAB10:    goto LAB8;

}

static void work_a_2092507588_3212880686_p_3(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    unsigned char t4;
    char *t5;
    char *t6;
    int t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    static char *nl0[] = {&&LAB6, &&LAB6, &&LAB5, &&LAB6, &&LAB6, &&LAB6, &&LAB6, &&LAB6, &&LAB6};

LAB0:    t1 = (t0 + 4720U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(189, ng3);
    t2 = (t0 + 1696U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t2 = (char *)((nl0) + t4);
    goto **((char **)t2);

LAB4:    xsi_set_current_line(189, ng3);

LAB9:    t2 = (t0 + 5364);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB10;

LAB1:    return;
LAB5:    xsi_set_current_line(190, ng3);
    t5 = (t0 + 1972U);
    t6 = *((char **)t5);
    t7 = *((int *)t6);
    t5 = (t0 + 5540);
    t8 = (t5 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    *((int *)t11) = t7;
    xsi_driver_first_trans_fast(t5);
    goto LAB4;

LAB6:    xsi_set_current_line(190, ng3);
    t2 = (t0 + 2064U);
    t3 = *((char **)t2);
    t12 = (31 - 15);
    t13 = (t12 * 1U);
    t14 = (0 + t13);
    t2 = (t3 + t14);
    t7 = work_a_2092507588_3212880686_sub_4093868711_3057020925(t0, t2);
    t5 = (t0 + 5540);
    t6 = (t5 + 32U);
    t8 = *((char **)t6);
    t9 = (t8 + 40U);
    t10 = *((char **)t9);
    *((int *)t10) = t7;
    xsi_driver_first_trans_fast(t5);
    goto LAB4;

LAB7:    t3 = (t0 + 5364);
    *((int *)t3) = 0;
    goto LAB2;

LAB8:    goto LAB7;

LAB10:    goto LAB8;

}

static void work_a_2092507588_3212880686_p_4(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    unsigned char t4;
    char *t5;
    char *t6;
    int t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    static char *nl0[] = {&&LAB6, &&LAB6, &&LAB5, &&LAB6, &&LAB6, &&LAB6, &&LAB6, &&LAB6, &&LAB6};

LAB0:    t1 = (t0 + 4864U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(193, ng3);
    t2 = (t0 + 1696U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t2 = (char *)((nl0) + t4);
    goto **((char **)t2);

LAB4:    xsi_set_current_line(193, ng3);

LAB9:    t2 = (t0 + 5372);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB10;

LAB1:    return;
LAB5:    xsi_set_current_line(194, ng3);
    t5 = (t0 + 1972U);
    t6 = *((char **)t5);
    t7 = *((int *)t6);
    t5 = (t0 + 5576);
    t8 = (t5 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    *((int *)t11) = t7;
    xsi_driver_first_trans_fast(t5);
    goto LAB4;

LAB6:    xsi_set_current_line(194, ng3);
    t2 = (t0 + 2064U);
    t3 = *((char **)t2);
    t12 = (31 - 23);
    t13 = (t12 * 1U);
    t14 = (0 + t13);
    t2 = (t3 + t14);
    t7 = work_a_2092507588_3212880686_sub_4093868711_3057020925(t0, t2);
    t5 = (t0 + 5576);
    t6 = (t5 + 32U);
    t8 = *((char **)t6);
    t9 = (t8 + 40U);
    t10 = *((char **)t9);
    *((int *)t10) = t7;
    xsi_driver_first_trans_fast(t5);
    goto LAB4;

LAB7:    t3 = (t0 + 5372);
    *((int *)t3) = 0;
    goto LAB2;

LAB8:    goto LAB7;

LAB10:    goto LAB8;

}

static void work_a_2092507588_3212880686_p_5(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    unsigned char t4;
    char *t5;
    char *t6;
    int t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    static char *nl0[] = {&&LAB6, &&LAB6, &&LAB5, &&LAB6, &&LAB6, &&LAB6, &&LAB6, &&LAB6, &&LAB6};

LAB0:    t1 = (t0 + 5008U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(197, ng3);
    t2 = (t0 + 1696U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t2 = (char *)((nl0) + t4);
    goto **((char **)t2);

LAB4:    xsi_set_current_line(197, ng3);

LAB9:    t2 = (t0 + 5380);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB10;

LAB1:    return;
LAB5:    xsi_set_current_line(198, ng3);
    t5 = (t0 + 1972U);
    t6 = *((char **)t5);
    t7 = *((int *)t6);
    t5 = (t0 + 5612);
    t8 = (t5 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    *((int *)t11) = t7;
    xsi_driver_first_trans_fast(t5);
    goto LAB4;

LAB6:    xsi_set_current_line(198, ng3);
    t2 = (t0 + 2064U);
    t3 = *((char **)t2);
    t12 = (31 - 31);
    t13 = (t12 * 1U);
    t14 = (0 + t13);
    t2 = (t3 + t14);
    t7 = work_a_2092507588_3212880686_sub_4093868711_3057020925(t0, t2);
    t5 = (t0 + 5612);
    t6 = (t5 + 32U);
    t8 = *((char **)t6);
    t9 = (t8 + 40U);
    t10 = *((char **)t9);
    *((int *)t10) = t7;
    xsi_driver_first_trans_fast(t5);
    goto LAB4;

LAB7:    t3 = (t0 + 5380);
    *((int *)t3) = 0;
    goto LAB2;

LAB8:    goto LAB7;

LAB10:    goto LAB8;

}

static void work_a_2092507588_3212880686_p_6(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;

LAB0:    xsi_set_current_line(205, ng3);
    t1 = (t0 + 2156U);
    t2 = *((char **)t1);
    t1 = (t0 + 10592U);
    t3 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t2, t1);
    t4 = (t3 > 17);
    if (t4 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(208, ng3);
    t1 = (t0 + 2156U);
    t2 = *((char **)t1);
    t1 = (t0 + 5648);
    t5 = (t1 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 9U);
    xsi_driver_first_trans_fast(t1);

LAB3:    t1 = (t0 + 5388);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(206, ng3);
    t5 = xsi_get_transient_memory(9U);
    memset(t5, 0, 9U);
    t6 = t5;
    memset(t6, (unsigned char)2, 9U);
    t7 = (t0 + 5648);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memcpy(t11, t5, 9U);
    xsi_driver_first_trans_fast(t7);
    goto LAB3;

}


extern void work_a_2092507588_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2092507588_3212880686_p_0,(void *)work_a_2092507588_3212880686_p_1,(void *)work_a_2092507588_3212880686_p_2,(void *)work_a_2092507588_3212880686_p_3,(void *)work_a_2092507588_3212880686_p_4,(void *)work_a_2092507588_3212880686_p_5,(void *)work_a_2092507588_3212880686_p_6};
	static char *se[] = {(void *)work_a_2092507588_3212880686_sub_4093868711_3057020925};
	xsi_register_didat("work_a_2092507588_3212880686", "isim/datapath1_isim_beh.exe.sim/work/a_2092507588_3212880686.didat");
	xsi_register_executes(pe);
	xsi_register_subprogram_executes(se);
}
