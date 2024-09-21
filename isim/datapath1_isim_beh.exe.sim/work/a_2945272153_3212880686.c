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
static const char *ng0 = "C:/Users/jerem/OneDrive/Desktop/projects/blowfish/f_function.vhd";
extern char *IEEE_P_3620187407;
extern char *IEEE_P_2592010699;

char *ieee_p_2592010699_sub_1697423399_503743352(char *, char *, char *, char *, char *, char *);
char *ieee_p_3620187407_sub_767668596_3965413181(char *, char *, char *, char *, char *, char *);


static void work_a_2945272153_3212880686_p_0(char *t0)
{
    char t1[16];
    char t4[16];
    char t7[16];
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned char t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;

LAB0:    xsi_set_current_line(58, ng0);

LAB3:    t2 = (t0 + 868U);
    t3 = *((char **)t2);
    t2 = (t0 + 3328U);
    t5 = (t0 + 776U);
    t6 = *((char **)t5);
    t5 = (t0 + 3312U);
    t8 = (t0 + 592U);
    t9 = *((char **)t8);
    t8 = (t0 + 3280U);
    t10 = (t0 + 684U);
    t11 = *((char **)t10);
    t10 = (t0 + 3296U);
    t12 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t7, t9, t8, t11, t10);
    t13 = ieee_p_2592010699_sub_1697423399_503743352(IEEE_P_2592010699, t4, t6, t5, t12, t7);
    t14 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t1, t3, t2, t13, t4);
    t15 = (t1 + 12U);
    t16 = *((unsigned int *)t15);
    t17 = (1U * t16);
    t18 = (32U != t17);
    if (t18 == 1)
        goto LAB5;

LAB6:    t19 = (t0 + 1860);
    t20 = (t19 + 32U);
    t21 = *((char **)t20);
    t22 = (t21 + 40U);
    t23 = *((char **)t22);
    memcpy(t23, t14, 32U);
    xsi_driver_first_trans_fast_port(t19);

LAB2:    t24 = (t0 + 1816);
    *((int *)t24) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(32U, t17, 0);
    goto LAB6;

}


extern void work_a_2945272153_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2945272153_3212880686_p_0};
	xsi_register_didat("work_a_2945272153_3212880686", "isim/datapath1_isim_beh.exe.sim/work/a_2945272153_3212880686.didat");
	xsi_register_executes(pe);
}
