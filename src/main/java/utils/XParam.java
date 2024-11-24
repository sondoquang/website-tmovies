package utils;



import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;
import org.apache.commons.beanutils.converters.DateTimeConverter;


import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


public class XParam {

    private static HttpServletRequest request;
    public XParam ( HttpServletRequest request){
        this.request = request;
    }

    public static String getString(String field, String defaultValue) {
        String value = request.getParameter(field);
        if(value == null) {
            return defaultValue;
        }
        return value;
    }

    public static int getInt(String field, int defaultValue) {
        String value = getString(field, String.valueOf(defaultValue));
        return Integer.parseInt(value);
    }

    public static double getDouble(String field, double defaultValue) {
        String value = getString(field, String.valueOf(defaultValue));
        return Double.parseDouble(value);
    }

    public static boolean getBoolean(String field, boolean defaultValue) {
        String value = getString(field, String.valueOf(defaultValue));
        return Boolean.parseBoolean(value);
    }

    public static Date getDate(String field, String pattern) {
        String value = getString(field, null);
        SimpleDateFormat format = new SimpleDateFormat(pattern);
        try {
            return format.parse(value);
        } catch (ParseException e) {
            return null;
        }
    }

    public static File getFile(String fileField, String folder) {
        try {
            Part part = request.getPart(fileField);
            File dir = new File(request.getServletContext().getRealPath(folder));
            if(!dir.exists()) {
                dir.mkdirs();
            }
            File file = new File(dir, part.getSubmittedFileName());
            part.write(file.getAbsolutePath());
            return file;
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    /**
     * Tạo bean và đọc giá trị các parameter vào các property cùng tên của bean <br>
     * Student sudent = XParam.getBean(Student.class);
     * @param clazz Bean class
     * @return đối tượng bean
     */
    public static <T> T getBean(Class<T> clazz) {
        DateTimeConverter dtc = new DateConverter(new Date());
        dtc.setPatterns(new String[] {"MM/dd/yyyy", "yyyy-MM-dd"});
        ConvertUtils.register(dtc, Date.class);
        try {
            T bean = clazz.getDeclaredConstructor().newInstance();
            BeanUtils.populate(bean, request.getParameterMap());
            return bean;
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
}
