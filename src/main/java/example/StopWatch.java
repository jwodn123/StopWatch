package example;

public class StopWatch {
    public static void main(String[] args) {

        int sTime = (int)System.currentTimeMillis()/10;
        Thread timeThread = new Thread() {

            public void run() {
                while(true){
                    int cTime = (int)System.currentTimeMillis()/10;
                    int rTime = cTime - sTime;
                    int ss1 = rTime %100;
                    int mm = rTime/100;
                    int ss = mm % 60;
                    int MM = mm / 60 % 60;
                    int HH = mm / 3600;
                    try {
                        Thread.sleep(10);
                    } catch (InterruptedException e) {}
                    System.out.println(HH +":"+ MM+":"+ss+"."+ss1);
                }
            }
        };
        timeThread.start();
    }
}
