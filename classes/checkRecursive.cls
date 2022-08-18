Global  Class checkRecursive{
    
    global static boolean run = true;
    global static boolean run1 = true;
    global  static boolean run2 = true;
    global  static boolean run3 = true;
    global  static boolean run4 = true;
    global  static boolean run5 = true;
    global  static boolean run6 = true;
    global  static boolean run7 = true;
    global static boolean run8=true;
    global static boolean  run9=true;
    global static boolean  batch=false;
    
    public static boolean runOnce(){
        if(run){
            run=false;
            return true;
        }else{
            return run;
        }
    }
    
    public static boolean runOnce1(){
        if(run1){
            run1=false;
            return true;
        }else{
            return run1;
        }
    }
    
    public static boolean runOnce2(){
        if(run2){
            run2=false;
            return true;
        }else{
            return run2;
        }
    }
    public static boolean runOncetrgUpdateAccOppSourceType(){
        if(run3){
            run3=false;
            return true;
        }else{
            return run3;
        }
    }
    
    public static boolean runOnceSetofBooks(){
        if(run5){
            run5=false;
            return true;
        }else{
            return run5;
        }
    }
    
    public static boolean runOnceFiveFiveDate(){
        if(run6){
            run6=false;
            return true;
        }else{
            return run6;
        }
    }
    public static boolean runOnceSaleEntity(){
        if(run7){
            run7=false;
            return true;
        }else{
            return run7;
        }
    }
    public static boolean runOnceEntityafterUpdate(){
        if(run8){
            run8=false;
            return true;
        }else{ 
            return run8;
        }
    }
    public static boolean runOnceEntityBeforeUpdate(){
        if(run9){
            run9=false;
            return true;
        }else{
            return run9;
        }
    }

    public static Boolean checkForBatch() {
        return batch;
    }

    public static void setBatchTrue() {
        batch = true;
    }

    public static void setBatchFalse() {
        batch = false;
    } 
    
}