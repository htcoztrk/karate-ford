package runner;


import com.intuit.karate.junit5.Karate;

public class UsersTest {

    public static String getName(){ return "Rıza Baba"; }
    public static String getJob(){ return "Emniyet Amiri"; }

    @Karate.Test
    Karate testUi() {return Karate.run("");
    }

}
