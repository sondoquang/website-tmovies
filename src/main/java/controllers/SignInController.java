
package controllers;

import daoimples.UserDAOImple;
import daos.UserDAO;
import entities.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.apache.commons.beanutils.BeanUtils;
import org.hibernate.internal.build.AllowSysOut;
import utils.XValidate;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Base64;

/**
 *
 * @author acer
 */
@WebServlet({"/signin"})
public class SignInController extends HttpServlet {
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/layout/Login.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String error = "";
        User user = new User();
        try {
            BeanUtils.populate(user, request.getParameterMap());
        } catch (IllegalAccessException | InvocationTargetException e) {
            e.printStackTrace();
        }
        switch (validate(user)){
            case -1: error="Fullname không đúng định dạng !";
                    break;
            case -2: error="Email không đúng định dạng !";
                    break;
            case -3: error="Password bắt buộc từ 6 - 30 kí tự !";
                    break;
            case -4: error="Username không được tồn tại kí tự khoảng cách!";
                    break;
            case -5: error="Username đã được sử dụng!";
            		break;        
        }
        if(!error.equals("")){
            request.getSession().setAttribute("isSignin",true);
            request.getSession().setAttribute("error", error);
        }else{
            UserDAO dao = new UserDAOImple();
            user.setAdmin(false);
            user.setUsername(user.getUsername().trim());
            dao.create(user);
            request.getSession().setAttribute("isSignin",false);
            request.getSession().setAttribute("isLogin",true);
        }
        response.sendRedirect(request.getSession().getAttribute("sercureUri")+"");
    }

    private int validate(User user){
        if (!XValidate.checkName(user.getFullname()))
            return -1;
        if (!XValidate.email(user.getEmail()))
            return -2;
        if (user.getPassword().length() < 6 || user.getPassword().length() > 30)
            return -3;
        if (!checkUserName(user.getUsername()))
            return -4;
        if (new UserDAOImple().checkValidUsername(user.getUsername().trim()))
        	return -5;
        return 1;
    }

    private boolean checkUserName(String userName){
        for (int i=0 ; i<userName.trim().length(); i++){
            if(userName.substring(i,i+1).equals(" ")){
                return false;
            }
        }
        return true;
    }

}
