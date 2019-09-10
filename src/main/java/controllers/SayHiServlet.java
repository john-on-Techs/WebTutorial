package controllers;

import beans.GreetinI;

import javax.inject.Inject;
import javax.inject.Named;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "SayHiServlet",urlPatterns = "/sayhi")
public class SayHiServlet extends HttpServlet {
    @Inject
    @Named("swa")
    private GreetinI swa;

    @Inject
    @Named("eng")
    private GreetinI eng;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            swa.sayHi();
            eng.sayHi();
    }
}
