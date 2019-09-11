package beans;

import qualifiers.EngSwa;
import qualifiers.SWA;

import javax.inject.Named;

@EngSwa(EngSwa.Lang.SWA)
public class SwaGreetingImpl  implements GreetinI{
    @Override
    public void sayHi() {
        System.out.println("Hujambo, u hali gani?");
    }
}
