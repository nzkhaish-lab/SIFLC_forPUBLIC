/*
 * SingleInputFLC.c
 *
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * Code generation for model "SingleInputFLC".
 *
 * Model version              : 1.2
 * Simulink Coder version : 23.2 (R2023b) 01-Aug-2023
 * C source code generated on : Thu Jun 19 13:17:31 2025
 *
 * Target selection: grt.tlc
 * Note: GRT includes extra infrastructure and instrumentation for prototyping
 * Embedded hardware selection: Intel->x86-64 (Windows64)
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "SingleInputFLC.h"
#include "rtwtypes.h"
#include <math.h>
#include "SingleInputFLC_private.h"
#include <string.h>
#include "rt_nonfinite.h"

/* Block signals (default storage) */
B_SingleInputFLC_T SingleInputFLC_B;

/* Block states (default storage) */
DW_SingleInputFLC_T SingleInputFLC_DW;

/* Real-time model */
static RT_MODEL_SingleInputFLC_T SingleInputFLC_M_;
RT_MODEL_SingleInputFLC_T *const SingleInputFLC_M = &SingleInputFLC_M_;

/* Forward declaration for local functions */
static real_T SingleInputFLC_trimf(real_T x, const real_T params[3]);

/* Function for MATLAB Function: '<S1>/Evaluate Rule Antecedents' */
static real_T SingleInputFLC_trimf(real_T x, const real_T params[3])
{
  real_T y;
  y = 0.0;
  if ((params[0] != params[1]) && (params[0] < x) && (x < params[1])) {
    y = 1.0 / (params[1] - params[0]) * (x - params[0]);
  }

  if ((params[1] != params[2]) && (params[1] < x) && (x < params[2])) {
    y = 1.0 / (params[2] - params[1]) * (params[2] - x);
  }

  if (x == params[1]) {
    y = 1.0;
  }

  return y;
}

/* Model step function */
void SingleInputFLC_step(void)
{
  real_T inputMFCache[7];
  real_T outputMFCache[7];
  real_T tmp[3];
  real_T lastSin_tmp;
  real_T x_idx_1;
  int32_T ruleID;
  static const real_T b[3] = { -0.1665, 0.0, 0.05 };

  static const real_T c[3] = { 0.05, 0.1, 0.15 };

  static const real_T d[3] = { 0.1, 0.15, 0.4 };

  static const real_T e[3] = { 0.2, 0.25, 0.9 };

  static const real_T f[3] = { 0.4, 0.5, 1.0 };

  static const real_T g[3] = { 0.9, 1.0, 1.167 };

  /* Sin: '<Root>/Sine Wave' */
  if (SingleInputFLC_DW.systemEnable != 0) {
    lastSin_tmp = SingleInputFLC_P.SineWave_Freq *
      SingleInputFLC_M->Timing.taskTime0;
    SingleInputFLC_DW.lastSin = sin(lastSin_tmp);
    SingleInputFLC_DW.lastCos = cos(lastSin_tmp);
    SingleInputFLC_DW.systemEnable = 0;
  }

  /* Sin: '<Root>/Sine Wave' */
  SingleInputFLC_B.SineWave = ((SingleInputFLC_DW.lastSin *
    SingleInputFLC_P.SineWave_PCos + SingleInputFLC_DW.lastCos *
    SingleInputFLC_P.SineWave_PSin) * SingleInputFLC_P.SineWave_HCos +
    (SingleInputFLC_DW.lastCos * SingleInputFLC_P.SineWave_PCos -
     SingleInputFLC_DW.lastSin * SingleInputFLC_P.SineWave_PSin) *
    SingleInputFLC_P.SineWave_Hsin) * SingleInputFLC_P.SineWave_Amp +
    SingleInputFLC_P.SineWave_Bias;

  /* Outputs for Atomic SubSystem: '<Root>/SIFLC' */
  /* MATLAB Function: '<S1>/Evaluate Rule Antecedents' */
  /* :  if SimulateUsing==1 && coder.internal.canUseExtrinsic ... */
  /* :          && (isa(inputs,'double') || isa(inputs,'single')) */
  /* :  else */
  /* :  if fis.inputFuzzySetType==1 */
  /* :  [antecedentOutputs,sumAntecedentOutputs] = ... */
  /* :              fuzzy.internal.codegen.evaluateRuleAntecedent(... */
  /* :              inputs,fis,diagnostics); */
  lastSin_tmp = 0.0;
  inputMFCache[0] = SingleInputFLC_trimf(SingleInputFLC_B.SineWave, b);
  tmp[0] = 0.0;
  tmp[1] = 0.05;
  tmp[2] = 0.1;
  inputMFCache[1] = SingleInputFLC_trimf(SingleInputFLC_B.SineWave, tmp);
  inputMFCache[2] = SingleInputFLC_trimf(SingleInputFLC_B.SineWave, c);
  inputMFCache[3] = SingleInputFLC_trimf(SingleInputFLC_B.SineWave, d);
  inputMFCache[4] = SingleInputFLC_trimf(SingleInputFLC_B.SineWave, e);
  inputMFCache[5] = SingleInputFLC_trimf(SingleInputFLC_B.SineWave, f);
  inputMFCache[6] = SingleInputFLC_trimf(SingleInputFLC_B.SineWave, g);
  for (ruleID = 0; ruleID < 7; ruleID++) {
    x_idx_1 = inputMFCache[ruleID];
    SingleInputFLC_B.antecedentOutputs[ruleID] = x_idx_1;
    lastSin_tmp += x_idx_1;
  }

  SingleInputFLC_B.sumAntecedentOutputs = lastSin_tmp;

  /* End of MATLAB Function: '<S1>/Evaluate Rule Antecedents' */

  /* MATLAB Function: '<S1>/Evaluate Rule Consequents' */
  /* :  if SimulateUsing==1 && coder.internal.canUseExtrinsic ... */
  /* :          && (isa(inputs,'double') || isa(inputs,'single')) */
  /* :  else */
  /* :  if fis.inputFuzzySetType==1 */
  /* :  if strcmp(char(fis.type),'mamdani') */
  /* :  else */
  /* :  aggregatedOutputs = ... */
  /* :                  fuzzy.internal.codegen.evaluateRuleConsequentForSugenoFIS(... */
  /* :                  inputs,antecedentOutputs,fis); */
  lastSin_tmp = 0.0;
  outputMFCache[0] = 0.0;
  outputMFCache[1] = -0.05;
  outputMFCache[2] = -0.1;
  outputMFCache[3] = -0.15;
  outputMFCache[4] = -0.3;
  outputMFCache[5] = -0.75;
  outputMFCache[6] = -1.0;
  for (ruleID = 0; ruleID < 7; ruleID++) {
    lastSin_tmp += outputMFCache[ruleID] *
      SingleInputFLC_B.antecedentOutputs[ruleID];
  }

  SingleInputFLC_B.aggregatedOutputs = lastSin_tmp;

  /* End of MATLAB Function: '<S1>/Evaluate Rule Consequents' */

  /* MATLAB Function: '<S1>/Defuzzify Outputs' */
  /* :  if SimulateUsing==1 && coder.internal.canUseExtrinsic ... */
  /* :          && (isa(aggregatedOutputs,'double') || isa(aggregatedOutputs,'single')) */
  /* :  else */
  /* :  if fis.inputFuzzySetType==1 */
  /* :  if isequal(fis.type,uint8('mamdani')) */
  /* :  else */
  /* :  defuzzifiedOutputs = ... */
  /* :                  fuzzy.internal.codegen.applySugenoDefuzzificationMethod(... */
  /* :                  sumAntecedentOutputs,aggregatedOutputs,fis,diagnostics); */
  if (SingleInputFLC_B.sumAntecedentOutputs == 0.0) {
    SingleInputFLC_B.defuzzifiedOutputs = -0.5;
  } else {
    SingleInputFLC_B.defuzzifiedOutputs = 1.0 /
      SingleInputFLC_B.sumAntecedentOutputs * SingleInputFLC_B.aggregatedOutputs;
  }

  /* End of MATLAB Function: '<S1>/Defuzzify Outputs' */
  /* End of Outputs for SubSystem: '<Root>/SIFLC' */
  /* Update for Sin: '<Root>/Sine Wave' */
  lastSin_tmp = SingleInputFLC_DW.lastSin;
  x_idx_1 = SingleInputFLC_DW.lastCos;
  SingleInputFLC_DW.lastSin = lastSin_tmp * SingleInputFLC_P.SineWave_HCos +
    x_idx_1 * SingleInputFLC_P.SineWave_Hsin;
  SingleInputFLC_DW.lastCos = x_idx_1 * SingleInputFLC_P.SineWave_HCos -
    lastSin_tmp * SingleInputFLC_P.SineWave_Hsin;

  /* Matfile logging */
  rt_UpdateTXYLogVars(SingleInputFLC_M->rtwLogInfo,
                      (&SingleInputFLC_M->Timing.taskTime0));

  /* signal main to stop simulation */
  {                                    /* Sample time: [0.001s, 0.0s] */
    if ((rtmGetTFinal(SingleInputFLC_M)!=-1) &&
        !((rtmGetTFinal(SingleInputFLC_M)-SingleInputFLC_M->Timing.taskTime0) >
          SingleInputFLC_M->Timing.taskTime0 * (DBL_EPSILON))) {
      rtmSetErrorStatus(SingleInputFLC_M, "Simulation finished");
    }
  }

  /* Update absolute time for base rate */
  /* The "clockTick0" counts the number of times the code of this task has
   * been executed. The absolute time is the multiplication of "clockTick0"
   * and "Timing.stepSize0". Size of "clockTick0" ensures timer will not
   * overflow during the application lifespan selected.
   * Timer of this task consists of two 32 bit unsigned integers.
   * The two integers represent the low bits Timing.clockTick0 and the high bits
   * Timing.clockTickH0. When the low bit overflows to 0, the high bits increment.
   */
  if (!(++SingleInputFLC_M->Timing.clockTick0)) {
    ++SingleInputFLC_M->Timing.clockTickH0;
  }

  SingleInputFLC_M->Timing.taskTime0 = SingleInputFLC_M->Timing.clockTick0 *
    SingleInputFLC_M->Timing.stepSize0 + SingleInputFLC_M->Timing.clockTickH0 *
    SingleInputFLC_M->Timing.stepSize0 * 4294967296.0;
}

/* Model initialize function */
void SingleInputFLC_initialize(void)
{
  /* Registration code */

  /* initialize non-finites */
  rt_InitInfAndNaN(sizeof(real_T));

  /* initialize real-time model */
  (void) memset((void *)SingleInputFLC_M, 0,
                sizeof(RT_MODEL_SingleInputFLC_T));
  rtmSetTFinal(SingleInputFLC_M, 2.0);
  SingleInputFLC_M->Timing.stepSize0 = 0.001;

  /* Setup for data logging */
  {
    static RTWLogInfo rt_DataLoggingInfo;
    rt_DataLoggingInfo.loggingInterval = (NULL);
    SingleInputFLC_M->rtwLogInfo = &rt_DataLoggingInfo;
  }

  /* Setup for data logging */
  {
    rtliSetLogXSignalInfo(SingleInputFLC_M->rtwLogInfo, (NULL));
    rtliSetLogXSignalPtrs(SingleInputFLC_M->rtwLogInfo, (NULL));
    rtliSetLogT(SingleInputFLC_M->rtwLogInfo, "tout");
    rtliSetLogX(SingleInputFLC_M->rtwLogInfo, "");
    rtliSetLogXFinal(SingleInputFLC_M->rtwLogInfo, "");
    rtliSetLogVarNameModifier(SingleInputFLC_M->rtwLogInfo, "rt_");
    rtliSetLogFormat(SingleInputFLC_M->rtwLogInfo, 4);
    rtliSetLogMaxRows(SingleInputFLC_M->rtwLogInfo, 0);
    rtliSetLogDecimation(SingleInputFLC_M->rtwLogInfo, 1);
    rtliSetLogY(SingleInputFLC_M->rtwLogInfo, "");
    rtliSetLogYSignalInfo(SingleInputFLC_M->rtwLogInfo, (NULL));
    rtliSetLogYSignalPtrs(SingleInputFLC_M->rtwLogInfo, (NULL));
  }

  /* block I/O */
  (void) memset(((void *) &SingleInputFLC_B), 0,
                sizeof(B_SingleInputFLC_T));

  /* states (dwork) */
  (void) memset((void *)&SingleInputFLC_DW, 0,
                sizeof(DW_SingleInputFLC_T));

  /* Matfile logging */
  rt_StartDataLoggingWithStartTime(SingleInputFLC_M->rtwLogInfo, 0.0,
    rtmGetTFinal(SingleInputFLC_M), SingleInputFLC_M->Timing.stepSize0,
    (&rtmGetErrorStatus(SingleInputFLC_M)));

  /* Enable for Sin: '<Root>/Sine Wave' */
  SingleInputFLC_DW.systemEnable = 1;
}

/* Model terminate function */
void SingleInputFLC_terminate(void)
{
  /* (no terminate code required) */
}
