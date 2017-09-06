package com.example.demo.util;

import java.util.List;


import javax.servlet.http.HttpServletRequest;

public class PageUtil {

	public static void page(HttpServletRequest request,Integer cpage,Integer pageSize,Integer count,List list,String url){
		//总页数
		int totalPage = (count/pageSize)+(count%pageSize==0?0:1);

		//首页
		String first = "";
		//上一页
		String prev = "";
		//下一页
		String next = "";
		//尾页
		String last = "";

		if(cpage.equals(1)){
			first = "首页";
			prev = "上一页";
		}else{
			first = "<a href='"+request.getContextPath()+""+url+"&cpage=1'>首页</a>";
			prev = "<a href='"+request.getContextPath()+""+url+"&cpage="+(cpage-1)+"'>上一页</a>";
		}

		if(cpage.equals(totalPage)||totalPage==0){
			next = "下一页";
			last = "尾页";
		}else{
			next = "<a href='"+request.getContextPath()+""+url+"&cpage="+(cpage+1)+"'>下一页</a>";
			last = "<a href='"+request.getContextPath()+""+url+"&cpage="+totalPage+"'>尾页</a>";
		}

		request.setAttribute("totalPage", totalPage);
		request.setAttribute("list", list);
		request.setAttribute("page", first+" "+prev+" "+next+" "+last+" "+cpage+"/"+totalPage);
	}
}
