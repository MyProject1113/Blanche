/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.35
 * Generated at: 2016-08-02 02:22:50 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.establish;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class applicationForm_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

final java.lang.String _jspx_method = request.getMethod();
if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
return;
}

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("\t<head>\r\n");
      out.write("\t\t<meta charset=\"UTF-8\" />\r\n");
      out.write("\t\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no\" />\r\n");
      out.write("\t\t<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\" />\r\n");
      out.write("\t\r\n");
      out.write("\t\t<title>프로젝트 개설 신청하기</title>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<!--[if lt IE 9]>\r\n");
      out.write("\t\t<script src=\"../js/html5shiv.js\"></script>\r\n");
      out.write("\t\t<![endif]-->\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<script type=\"text/javascript\" src=\"/include/js/common.js\"></script>\r\n");
      out.write("\t\t<script type=\"text/javascript\" src=\"/include/js/jquery-1.12.2.min.js\"></script>\r\n");
      out.write("\t\t<script type=\"text/javascript\">\r\n");
      out.write("\t\t\t$(function() {\r\n");
      out.write("\t\t\t\t/* 저장 버튼 클릭 시 처리 이벤트 */\r\n");
      out.write("\t\t\t\t$(\"#commit_btn\").click(function() {\r\n");
      out.write("\t\t\t\t\tif (!chkSubmit($(\"#app_topic\"), \"주제소개를\")) return;\r\n");
      out.write("\t\t\t\t\telse if (!chkSubmit($(\"#app_fund\"), \"목표자금을\")) return;\r\n");
      out.write("\t\t\t\t\telse if (!chkSubmit($(\"#app_field\"), \"분야를\")) return;\r\n");
      out.write("\t\t\t\t\telse if (!chkSubmit($(\"#request_phone_1\"), \"연락처를\")) return;\r\n");
      out.write("\t\t\t\t\telse if (!chkSubmit($(\"#request_phone_2\"), \"연락처를\")) return;\r\n");
      out.write("\t\t\t\t\telse if (!chkSubmit($(\"#request_phone_3\"), \"연락처를\")) return;\r\n");
      out.write("\t\t\t\t\telse {\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t$(\"#app_phone\").val($(\"#request_phone_1\").val() + \"-\" + $(\"#request_phone_2\").val() + \"-\" + $(\"#request_phone_3\").val());\r\n");
      out.write("\t\t\t\t\t\t$(\"#us_index\").val(2);\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t$(\"#new_project_request\").attr({\r\n");
      out.write("\t\t\t\t\t\t\t\"method\":\"POST\",\r\n");
      out.write("\t\t\t\t\t\t\t\"action\":\"/establish/applicationInsert.do\"\r\n");
      out.write("\t\t\t\t\t\t});\r\n");
      out.write("\t\t\t\t\t\t$(\"#new_project_request\").submit();\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t});\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t</script>\r\n");
      out.write("\t\t\r\n");
      out.write("\t</head>\r\n");
      out.write("\t<body>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<div class=\"container\">\r\n");
      out.write("\t\t\t<div class=\"box\">\r\n");
      out.write("\t\t\t\t<h2>프로젝트 개설 신청하기</h2>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t<form class=\"new_project_request\" id=\"new_project_request\">\r\n");
      out.write("\t\t\t\t\t<div class=\"app_form_question\">\r\n");
      out.write("\t\t\t\t\t\t<label class=\"app_form_label text-strong\" for=\"app_topic\">Q. 무엇을 만들려고 하나요?</label>\r\n");
      out.write("\t\t\t\t\t\t<textarea class=\"app_form_item\" id=\"app_topic\" name=\"app_topic\" cols=\"40\" rows=\"3\" placeholder=\"\"></textarea>\r\n");
      out.write("\t\t\t\t\t\t<p class=\"app_form_help\">* 소소한 것이라도 좋습니다. 가급적 구체적으로만 말씀해주세요.</p>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t<div class=\"app_form_question\">\r\n");
      out.write("\t\t\t\t\t\t<label class=\"app_form_label\" for=\"app_fund\">Q. 어느정도의 자금이 필요할까요?</label>\r\n");
      out.write("\t\t\t\t\t\t<input class=\"app_form_item\" id=\"app_fund\" name=\"app_fund\" type=\"number\" />&nbsp;만원\r\n");
      out.write("\t\t\t\t\t\t<p class=\"app_form_help\"></p>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t<div class=\"app_form_question\">\r\n");
      out.write("\t\t\t\t\t\t<label class=\"app_form_label\" for=\"app_field\">Q. 어느 분야라고 볼 수 있을까요?</label>\r\n");
      out.write("\t\t\t\t\t\t<select class=\"app_form_item\" id=\"app_field\" name=\"app_field\"><option value=\"\">분야 선택</option>\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"movie\">영화 ∙ 공연</option>\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"music\">음악</option>\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"design\">디자인</option>\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"book\">출판</option>\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"cooking\">요리</option>\r\n");
      out.write("\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\t<p class=\"app_form_help\"></p>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t<div class=\"app_form_question\">\r\n");
      out.write("\t\t\t\t\t\t<label class=\"app_form_label\" for=\"app_reference\">Q. 참고할만한 기존 작업이 있나요?</label>\r\n");
      out.write("\t\t\t\t\t\t<textarea class=\"app_form_item\" cols=\"40\" id=\"app_reference\" name=\"app_reference\" placeholder=\"\" rows=\"3\"></textarea>\r\n");
      out.write("\t\t\t\t\t\t<p class=\"app_form_help\">* 없어도 괜찮습니다. 참고할만한 링크가 있을 경우, 말씀해주세요</p>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t<div class=\"app_form_question\">\r\n");
      out.write("\t\t\t\t\t\t<label class=\"app_form_label\">Q. 운영진이 연락드릴 수 있는 번호를 남겨주세요</label>\r\n");
      out.write("\t\t\t\t\t\t<div class=\"app_form_item\">\r\n");
      out.write("\t\t\t\t\t\t<p>\r\n");
      out.write("\t\t\t\t\t\t<input type=\"tel\" class=\"app_form_tel\" id=\"request_phone_1\" name=\"request_phone_1\" size=\"10\" /> -\r\n");
      out.write("\t\t\t\t\t\t<input type=\"tel\" class=\"app_form_tel\" id=\"request_phone_2\" name=\"request_phone_2\" size=\"10\" /> -\r\n");
      out.write("\t\t\t\t\t\t<input type=\"tel\" class=\"app_form_tel\" id=\"request_phone_3\" name=\"request_phone_3\" size=\"10\" />\r\n");
      out.write("\t\t\t\t\t\t<input type=\"hidden\" id=\"app_phone\" name=\"app_phone\" />\r\n");
      out.write("\t\t\t\t\t\t</p>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t<p class=\"app_form_help\">* 필요한 경우, 직접 전화로 답변을 드리는 것이 더 빠를 수도 있습니다 :)</p>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t<input type=\"hidden\" id=\"us_index\" name=\"us_index\" />\r\n");
      out.write("\t\t\t\t\t<input type=\"hidden\" id=\"appro_check\" name=\"appro_check\" value=0 />\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t<input type=\"button\" id=\"commit_btn\" value=\"신청하기\" />\r\n");
      out.write("\t\t\t\t\t<input type=\"reset\" value=\"다시 작성 하기\" />\r\n");
      out.write("\t\t\t\t</form>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t</body>\r\n");
      out.write("</html>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}