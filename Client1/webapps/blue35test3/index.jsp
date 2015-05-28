<%@ include file="/WEB-INF/jsp/legacy/includes/jsp_header.jspf" %>
<%

String redirectPage = request.getContextPath() + "/content/html/home_en_US/index.jsp?time=" + new java.util.Date().getTime();
String home = Parts.getSkin(user).getHomePagePath(request);
String defaultHome = user.getPreferences().getDefaultHomePage();

com.schawk.products.parts.common.ui.bean.HomePage homePage = (com.schawk.products.parts.common.ui.bean.HomePage)Parts.getInstance().getApplicationContext().getBean("homePage");
if (homePage.containsKey(defaultHome) && !defaultHome.equals(com.schawk.products.parts.model.UserPreferences.HOMEPAGE_SITE_CONFIGURED))
{
  home = CommonHttpUtils.getAbsoluteLink( request, (String)homePage.getUrl(defaultHome) );
  redirectPage = home;
}
response.sendRedirect(redirectPage);


%>