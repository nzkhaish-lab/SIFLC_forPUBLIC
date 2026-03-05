/*
 * SingleInputFLC.h
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

#ifndef RTW_HEADER_SingleInputFLC_h_
#define RTW_HEADER_SingleInputFLC_h_
#ifndef SingleInputFLC_COMMON_INCLUDES_
#define SingleInputFLC_COMMON_INCLUDES_
#include "rtwtypes.h"
#include "rtw_continuous.h"
#include "rtw_solver.h"
#include "rt_logging.h"
#endif                                 /* SingleInputFLC_COMMON_INCLUDES_ */

#include "SingleInputFLC_types.h"
#include <float.h>
#include <string.h>
#include <stddef.h>
#include "rt_nonfinite.h"

/* Macros for accessing real-time model data structure */
#ifndef rtmGetFinalTime
#define rtmGetFinalTime(rtm)           ((rtm)->Timing.tFinal)
#endif

#ifndef rtmGetRTWLogInfo
#define rtmGetRTWLogInfo(rtm)          ((rtm)->rtwLogInfo)
#endif

#ifndef rtmGetErrorStatus
#define rtmGetErrorStatus(rtm)         ((rtm)->errorStatus)
#endif

#ifndef rtmSetErrorStatus
#define rtmSetErrorStatus(rtm, val)    ((rtm)->errorStatus = (val))
#endif

#ifndef rtmGetStopRequested
#define rtmGetStopRequested(rtm)       ((rtm)->Timing.stopRequestedFlag)
#endif

#ifndef rtmSetStopRequested
#define rtmSetStopRequested(rtm, val)  ((rtm)->Timing.stopRequestedFlag = (val))
#endif

#ifndef rtmGetStopRequestedPtr
#define rtmGetStopRequestedPtr(rtm)    (&((rtm)->Timing.stopRequestedFlag))
#endif

#ifndef rtmGetT
#define rtmGetT(rtm)                   ((rtm)->Timing.taskTime0)
#endif

#ifndef rtmGetTFinal
#define rtmGetTFinal(rtm)              ((rtm)->Timing.tFinal)
#endif

#ifndef rtmGetTPtr
#define rtmGetTPtr(rtm)                (&(rtm)->Timing.taskTime0)
#endif

/* Block signals (default storage) */
typedef struct {
  real_T SineWave;                     /* '<Root>/Sine Wave' */
  real_T aggregatedOutputs;            /* '<S1>/Evaluate Rule Consequents' */
  real_T antecedentOutputs[7];         /* '<S1>/Evaluate Rule Antecedents' */
  real_T sumAntecedentOutputs;         /* '<S1>/Evaluate Rule Antecedents' */
  real_T defuzzifiedOutputs;           /* '<S1>/Defuzzify Outputs' */
} B_SingleInputFLC_T;

/* Block states (default storage) for system '<Root>' */
typedef struct {
  real_T lastSin;                      /* '<Root>/Sine Wave' */
  real_T lastCos;                      /* '<Root>/Sine Wave' */
  int32_T systemEnable;                /* '<Root>/Sine Wave' */
} DW_SingleInputFLC_T;

/* Parameters (default storage) */
struct P_SingleInputFLC_T_ {
  real_T OutputSamplePoints_Value;     /* Expression: fis.outputSamplePoints
                                        * Referenced by: '<S1>/Output Sample Points'
                                        */
  real_T SineWave_Amp;                 /* Expression: 0.5
             * Referenced by: '<Root>/Sine Wave'
                                        */
  real_T SineWave_Bias;                /* Expression: 0.5
                                        * Referenced by: '<Root>/Sine Wave'
                                        */
  real_T SineWave_Freq;                /* Expression: 2*pi*1
                                        * Referenced by: '<Root>/Sine Wave'
                                        */
  real_T SineWave_Hsin;                /* Computed Parameter: SineWave_Hsin
                                        * Referenced by: '<Root>/Sine Wave'
                                        */
  real_T SineWave_HCos;                /* Computed Parameter: SineWave_HCos
                                        * Referenced by: '<Root>/Sine Wave'
                                        */
  real_T SineWave_PSin;                /* Computed Parameter: SineWave_PSin
                                        * Referenced by: '<Root>/Sine Wave'
                                        */
  real_T SineWave_PCos;                /* Computed Parameter: SineWave_PCos
                                        * Referenced by: '<Root>/Sine Wave'
                                        */
};

/* Real-time Model Data Structure */
struct tag_RTM_SingleInputFLC_T {
  const char_T *errorStatus;
  RTWLogInfo *rtwLogInfo;

  /*
   * Timing:
   * The following substructure contains information regarding
   * the timing information for the model.
   */
  struct {
    time_T taskTime0;
    uint32_T clockTick0;
    uint32_T clockTickH0;
    time_T stepSize0;
    time_T tFinal;
    boolean_T stopRequestedFlag;
  } Timing;
};

/* Block parameters (default storage) */
extern P_SingleInputFLC_T SingleInputFLC_P;

/* Block signals (default storage) */
extern B_SingleInputFLC_T SingleInputFLC_B;

/* Block states (default storage) */
extern DW_SingleInputFLC_T SingleInputFLC_DW;

/* Model entry point functions */
extern void SingleInputFLC_initialize(void);
extern void SingleInputFLC_step(void);
extern void SingleInputFLC_terminate(void);

/* Real-time Model object */
extern RT_MODEL_SingleInputFLC_T *const SingleInputFLC_M;

/*-
 * These blocks were eliminated from the model due to optimizations:
 *
 * Block '<S1>/InputConversion' : Eliminate redundant data type conversion
 */

/*-
 * The generated code includes comments that allow you to trace directly
 * back to the appropriate location in the model.  The basic format
 * is <system>/block_name, where system is the system number (uniquely
 * assigned by Simulink) and block_name is the name of the block.
 *
 * Use the MATLAB hilite_system command to trace the generated code back
 * to the model.  For example,
 *
 * hilite_system('<S3>')    - opens system 3
 * hilite_system('<S3>/Kp') - opens and selects block Kp which resides in S3
 *
 * Here is the system hierarchy for this model
 *
 * '<Root>' : 'SingleInputFLC'
 * '<S1>'   : 'SingleInputFLC/SIFLC'
 * '<S2>'   : 'SingleInputFLC/SIFLC/Defuzzify Outputs'
 * '<S3>'   : 'SingleInputFLC/SIFLC/Evaluate Rule Antecedents'
 * '<S4>'   : 'SingleInputFLC/SIFLC/Evaluate Rule Consequents'
 */
#endif                                 /* RTW_HEADER_SingleInputFLC_h_ */
