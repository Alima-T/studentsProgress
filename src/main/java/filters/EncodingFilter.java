package filters;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

// Фильтр решает проблему кодировки, когда кирилица не читается сервлетом,
// является прослойкой между браузером и сервлетом, фильтр это кусочек кода для многократного использования,
// позволяющий производить операции над содержимым HTTP-запросов, ответов и заголовков.
// обрабатывает запрос до получения его сервлетом и после его обработки сервлетом
public class EncodingFilter implements Filter { //имплементировать filter javax.servlet, 3 метода, реализовываем только doFilter
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;//преобразовываем в HttpServletRequest
        HttpServletResponse resp = (HttpServletResponse) servletResponse;//преобразовываем в HttpServletResponse
        //запрос
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        // ответ
        filterChain.doFilter(req, resp);//канал фильтров отправляет дальше  на сервлет (если фильтров больше нет)
        //Все что написано после filterChain.doFilter отрабатывается после сервлета

    }

    @Override
    public void destroy() {

    }
}
