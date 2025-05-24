**Analysis of speed control of DC motor using LQR (Linear Quadratic Regulator) method.**

**PROBLEM STATEMENT: -**

The optimization of DC motor speed using Linear Quadratic Regulator (LQR) controllers in various applications. Three types of DC motors are analysed under a unit step response, and LQR controller parameters are tuned through trial and error for optimal results. The study focuses on comparing transient parameters, including rise time, maximum overshoot, and settling time, to evaluate the effectiveness of LQR controllers in different power-rated DC motors.

**SOLUTION GIVEN IN THE PAPER: -**

1) **Modelling: -**

DC motor’s adaptability to adjustable speed drives makes it preferred to ac motors which are associated with a constant speed rotating fields. Since DC motors can be adjusted over a wide range of operating speed, a variety of methods are used.

![](images/raw/Aspose.Words.d024fdda-7adf-4547-b82b-7f071d808739.001.png)
![](images/raw/Aspose.Words.d024fdda-7adf-4547-b82b-7f071d808739.002.png)
The linear model of a simple DC motor consists of an electrical equation and a mechanical equation. Applying Kirchhoff’s Voltage Law (KVL) and Newton’s second law, equation (1) and (2) is obtained

![](images/raw/Aspose.Words.d024fdda-7adf-4547-b82b-7f071d808739.003.png)

![](images/raw/Aspose.Words.d024fdda-7adf-4547-b82b-7f071d808739.004.png)

![](images/raw/Aspose.Words.d024fdda-7adf-4547-b82b-7f071d808739.005.png)
The Steady state representation of the DC motor from the above equation is 

![](images/raw/Aspose.Words.d024fdda-7adf-4547-b82b-7f071d808739.006.png)

By using the formula of transfer function to state space model, the DC Motor transfer function is been obtained as.

![](images/raw/Aspose.Words.d024fdda-7adf-4547-b82b-7f071d808739.007.png) 

![](images/raw/Aspose.Words.d024fdda-7adf-4547-b82b-7f071d808739.008.png)

**Linear Quadratic Regulator (LQR): -** 

It is a technique employed in modern control theory, particularly in the analysis of systems using the state-space approach. This method is favoured for its simplicity, making it suitable for multi-input multi-output systems. The broad applicability of the LQR design technique is evident in various fields.

In the context of a DC motor control system, the speed of the motor can undergo changes due to variations in load and external disturbances. The primary objective of the LQR is to minimize deviations in the motor speed. The system's output, the motor speed, is compared with the applied input, which is the motor voltage. The LQR is responsible for reducing deviations in the motor speed, thus optimizing the system's performance.

![](images/raw/Aspose.Words.d024fdda-7adf-4547-b82b-7f071d808739.009.png)
The general Block diagram of equation for this system is been built on the MATLAB Simulink and it is expressed as follows:

![](images/raw/Aspose.Words.d024fdda-7adf-4547-b82b-7f071d808739.010.png)

1) **Analysis: -**

The State equation of the system is written as X\* = AX +Bu here A represents the state matrix of order n\*n and B represents the control matrix of order n, m where the n and m represents the number of state variable and the input variable. 

The linear quadratic regulator controller is designed such that the performance index is reduced to a minimized value. This is meant for achieving the desired performance of the system. The performance index (J) for a linear quadratic regulator controller is designed as

![](images/raw/Aspose.Words.d024fdda-7adf-4547-b82b-7f071d808739.011.png)

The iterative process involves trial and error, considering system issues for Q and R matrix selection. While straightforward for LQR applications, this method can be time-consuming, depending on optimal Q and R values. Matrix elements correspond to system variables state for Q and input for R. The closed loop optimal control law is defined as **u\*= -Kx.** the proper placement of closed loop poles for the minimization. The feedback gain matrix K is dependent on A, B, Q and R matrices. The feedback gain matrix k is obtained by solving the Algebraic Riccati Equation (ARE), P defines a symmetric and positive definite matrix which is obtained by solution of the ARE is defined as.

![](images/raw/Aspose.Words.d024fdda-7adf-4547-b82b-7f071d808739.012.png)
![](images/raw/Aspose.Words.d024fdda-7adf-4547-b82b-7f071d808739.013.png)

![](images/raw/Aspose.Words.d024fdda-7adf-4547-b82b-7f071d808739.014.png)

1) **Design: -**

![](images/raw/Aspose.Words.d024fdda-7adf-4547-b82b-7f071d808739.015.png)
The transfer function of the three motors is given by the following equations.

1. **Test Case Motor – 1 : -**  
   The transfer function of the DC Motor 1 is used to find out the response of the system while applying the step function as an input. The tuning of different points such as the LQR parameter Q and R is done with various values. The matrices A, B, C and D obtained from the specification of DC motor are **A = [-4 -0.02; 0.5 -10] B = [4; 0] C = [0 1] D = [0]** respectively. The Q and R values**, R = 0.000000009 Q = [0.000000009; 15]** are used in motor 1, giving a dynamic response.

2. **Test Case Motor – 2 : -**

   The transfer function of the DC Motor 2 is used to find out the response of the system while applying the step function as an input. The tuning of different points such as the LQR parameter Q and R is done with various values. The matrices A, B, C and D obtained from the specification of DC motor are **A = [-4 -0.4; 0.1666 -0.1666] B = [4; 0] C = [0 1] D = [0]** respectively. The Q and R values**, R = 0.000000009 Q = [0.000000009; 15]** are used in motor 2, giving a dynamic response.

3. **Test Case Motor 3 : -**

![](images/raw/Aspose.Words.d024fdda-7adf-4547-b82b-7f071d808739.016.png)
The transfer function of the DC Motor 3 is used to find out the response of the system while applying the step function as an input. The tuning of different points such as the LQR parameter Q and R is done with various values. The matrices A, B, C and D obtained from the specification of DC motor are **A = [-2 -0.046 ;2.3 -0.003] B = [2 ; 0] C = [ 0 1 ] D = [ 0 ]** respectively. The Q and R values**, R = 0.000000009 Q = [0.000000009; 15]** are used in motor 2, giving a dynamic response.

![](images/raw/Aspose.Words.d024fdda-7adf-4547-b82b-7f071d808739.017.png)

|**DC Motor Parameters**|**Motor 1**|**Motor 2**|**Motor 3**|
| :- | :-: | :-: | :-: |
|Armature Resistance Ra (Ohm)|2|2|1|
|Armature Inductance La (H)|0.5|0.5|0.5|
|Moment of inertia J (Kgm2)|0.02|1.2|0.01|
|Friction constant B (Nms)|0.2|0.2|0.00003|
|Torque constant KT (Nm/A)|0.015|0.2|0.023|
|EMF constant Kb (Vs/rad)|0.01|0.2|0.023|

![](images/raw/Aspose.Words.d024fdda-7adf-4547-b82b-7f071d808739.018.png)

![](images/raw/Aspose.Words.d024fdda-7adf-4547-b82b-7f071d808739.019.png)
![](images/raw/Aspose.Words.d024fdda-7adf-4547-b82b-7f071d808739.020.png)
**SIMULATION: -** 

![](images/raw/Aspose.Words.d024fdda-7adf-4547-b82b-7f071d808739.021.png)
![](images/raw/Aspose.Words.d024fdda-7adf-4547-b82b-7f071d808739.022.png)

**RESULT: -**

Create the state space model and plot the step response through MATLAB code and simulation execution.

- **Motor 1: -**  
![](images/raw/Aspose.Words.d024fdda-7adf-4547-b82b-7f071d808739.023.jpeg)
![](images/raw/Aspose.Words.d024fdda-7adf-4547-b82b-7f071d808739.024.jpeg)

![](images/raw/Aspose.Words.d024fdda-7adf-4547-b82b-7f071d808739.025.png)

- **Motor 2: -**  
![](images/raw/Aspose.Words.d024fdda-7adf-4547-b82b-7f071d808739.026.png)
![](images/raw/Aspose.Words.d024fdda-7adf-4547-b82b-7f071d808739.027.jpeg)
![](images/raw/Aspose.Words.d024fdda-7adf-4547-b82b-7f071d808739.028.jpeg)

- **Motor 3: -**  
![](images/raw/Aspose.Words.d024fdda-7adf-4547-b82b-7f071d808739.029.jpeg)
![](images/raw/Aspose.Words.d024fdda-7adf-4547-b82b-7f071d808739.030.jpeg)

![](images/raw/Aspose.Words.d024fdda-7adf-4547-b82b-7f071d808739.031.png)

- **Combine Response: -**  
![](images/raw/Aspose.Words.d024fdda-7adf-4547-b82b-7f071d808739.032.png)
![](images/raw/Aspose.Words.d024fdda-7adf-4547-b82b-7f071d808739.033.jpeg)

![](images/raw/Aspose.Words.d024fdda-7adf-4547-b82b-7f071d808739.034.jpeg)

![](images/raw/Aspose.Words.d024fdda-7adf-4547-b82b-7f071d808739.035.png)

|**System information**|**Motor 1**|**Motor 2**|**Motor 3**|
| :- | :-: | :-: | :-: |
|RiseTime|0.0087|0.0184|0.005|
|TransientTime|0.0241|0.0511|0.0138|
|SettlingTime|0.0241|0.0511|0.0138|
|SettlingMin|2.21E-05|2.21E-05|2.21E-05|
|SettlingMax|2.56E-05|2.56E-05|2.56E-05|
|Overshoot|4.3074|4.3108|4.3207|
|Peak|2.56E-05|2.56E-05|2.56E-05|
|PeakTime|0.0179|0.0379|0.0102|

![](images/raw/Aspose.Words.d024fdda-7adf-4547-b82b-7f071d808739.036.png)

**INTERPRETATION: -**

This paper explores the transient response of DC motors with varying power ratings by employing an LQR optimal controller. The study, conducted through simulations in MATLAB, specifically focuses on three motors. The results indicate that the LQR controller enhances the dynamic performance of lower-power DC motors, particularly motor 3, showing improvements in both rise time and settling time. 

The implications of these findings suggest that the LQR controller could effectively mitigate the impact of jitter and transportation delay in closed-loop responses, benefiting applications like cruise control and process control. Additionally, the paper suggests that further research into the selection of parameters Q and R in the LQR method could provide valuable insights into optimizing generic systems.

**REFERENCE: -**

Saisudha, V. & Seeja, G. & Pillay, R.V. & Manikutty, Gayathri & Rao, Bhavani. (2016). Analysis of speed control of DC motor using LQR method. 9. 7377-7385.
