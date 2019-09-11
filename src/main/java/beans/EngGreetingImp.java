package beans;

import qualifiers.ENG;
import qualifiers.EngSwa;

import javax.enterprise.inject.Any;
import javax.enterprise.inject.Default;


//@ENG
@EngSwa(EngSwa.Lang.ENG)

public class EngGreetingImp  implements GreetinI{
    @Override
    public void sayHi() {
        System.out.println("Hello, how are you?");
    }
}
