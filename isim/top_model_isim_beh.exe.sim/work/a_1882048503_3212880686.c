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
static const char *ng0 = "C:/Users/jerem/OneDrive/Desktop/projects/blowfish/register_576.vhd";
extern char *IEEE_P_1242562249;
extern char *IEEE_P_2592010699;

int ieee_p_1242562249_sub_1657552908_1035706684(char *, char *, char *);
unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_1882048503_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;

LAB0:    xsi_set_current_line(60, ng0);

LAB3:    t1 = (t0 + 684U);
    t2 = *((char **)t1);
    t1 = (t0 + 5024U);
    t3 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t2, t1);
    t4 = (t0 + 2676);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    *((int *)t8) = t3;
    xsi_driver_first_trans_fast(t4);

LAB2:    t9 = (t0 + 2616);
    *((int *)t9) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_1882048503_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t7;
    char *t9;
    char *t11;
    char *t13;
    char *t15;
    char *t17;
    char *t19;
    char *t21;
    char *t23;
    char *t25;
    char *t27;
    char *t29;
    char *t31;
    char *t33;
    char *t35;
    char *t37;
    char *t39;
    char *t40;
    char *t41;
    char *t42;
    char *t43;

LAB0:    xsi_set_current_line(63, ng0);

LAB3:    t1 = xsi_get_transient_memory(576U);
    memset(t1, 0, 576U);
    t2 = t1;
    t3 = (t0 + 6312);
    memcpy(t2, t3, 32U);
    t2 = (t2 + 32U);
    t5 = (t0 + 6344);
    memcpy(t2, t5, 32U);
    t2 = (t2 + 32U);
    t7 = (t0 + 6376);
    memcpy(t2, t7, 32U);
    t2 = (t2 + 32U);
    t9 = (t0 + 6408);
    memcpy(t2, t9, 32U);
    t2 = (t2 + 32U);
    t11 = (t0 + 6440);
    memcpy(t2, t11, 32U);
    t2 = (t2 + 32U);
    t13 = (t0 + 6472);
    memcpy(t2, t13, 32U);
    t2 = (t2 + 32U);
    t15 = (t0 + 6504);
    memcpy(t2, t15, 32U);
    t2 = (t2 + 32U);
    t17 = (t0 + 6536);
    memcpy(t2, t17, 32U);
    t2 = (t2 + 32U);
    t19 = (t0 + 6568);
    memcpy(t2, t19, 32U);
    t2 = (t2 + 32U);
    t21 = (t0 + 6600);
    memcpy(t2, t21, 32U);
    t2 = (t2 + 32U);
    t23 = (t0 + 6632);
    memcpy(t2, t23, 32U);
    t2 = (t2 + 32U);
    t25 = (t0 + 6664);
    memcpy(t2, t25, 32U);
    t2 = (t2 + 32U);
    t27 = (t0 + 6696);
    memcpy(t2, t27, 32U);
    t2 = (t2 + 32U);
    t29 = (t0 + 6728);
    memcpy(t2, t29, 32U);
    t2 = (t2 + 32U);
    t31 = (t0 + 6760);
    memcpy(t2, t31, 32U);
    t2 = (t2 + 32U);
    t33 = (t0 + 6792);
    memcpy(t2, t33, 32U);
    t2 = (t2 + 32U);
    t35 = (t0 + 6824);
    memcpy(t2, t35, 32U);
    t2 = (t2 + 32U);
    t37 = (t0 + 6856);
    memcpy(t2, t37, 32U);
    t39 = (t0 + 2712);
    t40 = (t39 + 32U);
    t41 = *((char **)t40);
    t42 = (t41 + 40U);
    t43 = *((char **)t42);
    memcpy(t43, t1, 576U);
    xsi_driver_first_trans_fast(t39);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_1882048503_3212880686_p_2(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    unsigned char t7;
    unsigned char t8;
    char *t9;
    unsigned char t10;
    int t11;
    int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    char *t16;
    char *t17;

LAB0:    xsi_set_current_line(69, ng0);
    t1 = (t0 + 1236U);
    t2 = *((char **)t1);
    t1 = (t0 + 2748);
    t3 = (t1 + 32U);
    t4 = *((char **)t3);
    t5 = (t4 + 40U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 576U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(70, ng0);
    t1 = (t0 + 960U);
    t2 = *((char **)t1);
    t7 = *((unsigned char *)t2);
    t8 = (t7 == (unsigned char)3);
    if (t8 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 752U);
    t7 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t7 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 2624);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(71, ng0);
    t1 = (t0 + 1144U);
    t3 = *((char **)t1);
    t1 = (t0 + 2748);
    t4 = (t1 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 40U);
    t9 = *((char **)t6);
    memcpy(t9, t3, 576U);
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

LAB5:    xsi_set_current_line(73, ng0);
    t2 = (t0 + 1052U);
    t3 = *((char **)t2);
    t8 = *((unsigned char *)t3);
    t10 = (t8 == (unsigned char)3);
    if (t10 != 0)
        goto LAB7;

LAB9:
LAB8:    goto LAB3;

LAB7:    xsi_set_current_line(74, ng0);
    t2 = (t0 + 868U);
    t4 = *((char **)t2);
    t2 = (t0 + 1328U);
    t5 = *((char **)t2);
    t11 = *((int *)t5);
    t12 = (t11 - 0);
    t13 = (t12 * 1);
    t14 = (32U * t13);
    t15 = (0U + t14);
    t2 = (t0 + 2748);
    t6 = (t2 + 32U);
    t9 = *((char **)t6);
    t16 = (t9 + 40U);
    t17 = *((char **)t16);
    memcpy(t17, t4, 32U);
    xsi_driver_first_trans_delta(t2, t15, 32U, 0LL);
    goto LAB8;

}

static void work_a_1882048503_3212880686_p_3(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    int t4;
    int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;

LAB0:    xsi_set_current_line(81, ng0);

LAB3:    t1 = (t0 + 1236U);
    t2 = *((char **)t1);
    t1 = (t0 + 1328U);
    t3 = *((char **)t1);
    t4 = *((int *)t3);
    t5 = (t4 - 0);
    t6 = (t5 * 1);
    xsi_vhdl_check_range_of_index(0, 17, 1, t4);
    t7 = (32U * t6);
    t8 = (0 + t7);
    t1 = (t2 + t8);
    t9 = (t0 + 2784);
    t10 = (t9 + 32U);
    t11 = *((char **)t10);
    t12 = (t11 + 40U);
    t13 = *((char **)t12);
    memcpy(t13, t1, 32U);
    xsi_driver_first_trans_fast_port(t9);

LAB2:    t14 = (t0 + 2632);
    *((int *)t14) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_1882048503_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1882048503_3212880686_p_0,(void *)work_a_1882048503_3212880686_p_1,(void *)work_a_1882048503_3212880686_p_2,(void *)work_a_1882048503_3212880686_p_3};
	xsi_register_didat("work_a_1882048503_3212880686", "isim/top_model_isim_beh.exe.sim/work/a_1882048503_3212880686.didat");
	xsi_register_executes(pe);
}
