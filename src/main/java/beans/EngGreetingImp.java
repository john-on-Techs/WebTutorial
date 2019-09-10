package beans;

import javax.inject.Named;

@Named("eng")
public class EngGreetingImp  implements GreetinI{
    @Override
    public void sayHi() {
        System.out.println("Hello, how are you?");
    }
}
