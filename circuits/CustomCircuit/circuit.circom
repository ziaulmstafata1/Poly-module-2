pragma circom 2.0.0;

template CustomCircuit () {  
    // signal inputs

    signal input a;
    signal input b;


    // signals from gates
    signal x;
    signal y;

    // final signal output
    signal output q;

    // component gates 
    component andGate = AND();
    component notGate = NOT();
    component orGate = OR();

    // circuit logic

    // and gate 
    andGate.a <== a;
    andGate.b <== b;

    x <== andGate.out;

    // not gate
    notGate.in <==b;

    y <== notGate.out;

    // or gate
    orGate.a <== x;
    orGate.b <== y;
    
    q <== orGate.out;
    
}

template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a*b;
}

template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}

template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a*b;
}
component main = CustomCircuit();