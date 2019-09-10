package beans;

import javax.inject.Named;

@Named("swa")
public class SwaGreetingImpl  implements GreetinI{
    @Override
    public void sayHi() {
        System.out.println("Hujambo, u hali gani?");
    }
}
