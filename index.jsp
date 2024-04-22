<%-- 
    Document   : index
    Created on : Mar 22, 2024, 2:22:14 AM
    Author     : Peace
--%>


<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="com.dao.bookDaoimpl"%>
<%@page import="java.sql.*" %>
<%@page import="com.DB.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EBook: Index</title>
        <%@include file="AllComponent/Allcss.jsp"%>
        
        <style type="text/css">
            .back-img{
                background: url("img/main 4.jpg");
                height: 70vh;
                width: 100%;
                background-repeat: no-repeat;
                background-size: cover;
                
            }
            
            .crd-ho:hover{
                background-color: #fcf7f7; 
            }
            
        </style>
        
        
        
    </head>
    <body style="background-color: #f7f7f7">
        
        <%
           User u = (User)session.getAttribute("userobj");
        %>
        
        
        
        <%@include file="AllComponent/navbar.jsp"%>
        <div class="container-fluid back-img">
            <h2 class="text-center text-white">E-Book Management System</h2>
        </div>
        
        
        <!-- Start Recent Books -->
        <div class="container" >
            <h3 class="text-center">Recent Books</h3>
            <div class="row">
            
            <%
                      bookDaoimpl dao2 = new bookDaoimpl(DBConnect.mycon());
                      List<BookDetails> list2 = dao2.getRecentBook();
                      for(BookDetails b : list2){
                      %>
                      
                       <div class="col-md-3">
                       <div class="card crd-ho">
                        <div class="card-body text-center"> 
                        <img alt="" src="book/<%=b.getPhotoName()%>"
                             style="width: 150px; height: 200px;" class="img-thumbin">
                        <p><%=b.getBookName()%></p>
                        <p><%=b.getAuthor()%></p>
                        <p>
                            
                            <%
                            if(b.getBookCategory().equals("old")){
                            %>
                             Categories: <%=b.getBookCategory()%></p>
                            <div class="row">
                                
                               
                                <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-5">View Details</a>
                                <a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%></a>         
                        </div>
                        
                            <%
                            }

                        else{ 
                            %>
                            Categories: <%=b.getBookCategory()%></p>
                        <div class="row">

                                <%
                                if(u == null){
                                %>
                                <a href="login.jsp" class="btn btn-danger btn-sm ml-2">Add Cart</a>
                                <%
                                } else{
                                %>
                                <a href="cart?bid=<%=b.getBookId() %>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-2">Add Cart</a>
                                <%
                                }
                                %>
                            
                           
                            <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-1">View Details</a>
                            <a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%></a>
                            
                            
                        </div>
                            <%
                            }
                            %>

                            
                            
                    </div>
                </div>
             </div>            
         
                        <%
                        }
                        %>
                        
       </div> 
            
            
            
            <div class="text-center mt-1">
                <a href="all_recent_book.jsp" class="btn btn-danger btn-sm">View All</a>
            </div>
            
    </div>
            
        
       <!-- End Recent Books --> 
       
       <hr>
       
       
        <!-- Start New Books -->
        <div class="container" >
            <h3 class="text-center">New Books</h3>
            <div class="row">
                
                    
                    <%
                      bookDaoimpl dao = new bookDaoimpl(DBConnect.mycon());
                      List<BookDetails> list = dao.getNewBook();
                      for(BookDetails b : list){
                      %>
                      
                       <div class="col-md-3">
                       <div class="card crd-ho">
                        <div class="card-body text-center"> 
                        <img alt="" src="book/<%=b.getPhotoName()%>"
                             style="width: 150px; height: 200px;" class="img-thumbin">
                        <p><%=b.getBookName()%></p>
                        <p><%=b.getAuthor()%></p>
                        <p>Categories: <%=b.getBookCategory()%></p>
                        
                        <div class="row">
                            
                                <%
                                if(u == null){
                                %>
                                <a href="login.jsp" class="btn btn-danger btn-sm ml-2">Add Cart</a>
                                <%
                                } else{
                                %>
                                <a href="cart?bid=<%=b.getBookId() %>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-2">Add Cart</a>
                                <%
                                }
                                %>
                            
                            
                            <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-1">View Details</a>
                            <a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%></a>
                            
                            
                        </div>
                    </div>
                </div> 
            </div> 
                      <%
                      
                        }
                        %>
                    
                    
                   
            </div>
                
        
            
            <div class="text-center mt-1">
                <a href="all_new_book.jsp" class="btn btn-danger btn-sm">View All</a>
            </div>
            
    </div>
            
        
       <!<!-- End New Books --> 
       
       <hr>
        <!<!-- Start old Books -->
        <div class="container" >
            <h3 class="text-center">Old Books</h3>
            <div class="row">
                
                 <%
                      bookDaoimpl dao3 = new bookDaoimpl(DBConnect.mycon());
                      List<BookDetails> list3 = dao2.getOldBook();
                      for(BookDetails b : list3){
                      %>
                      
                       <div class="col-md-3">
                       <div class="card crd-ho">
                        <div class="card-body text-center"> 
                        <img alt="" src="book/<%=b.getPhotoName()%>"
                             style="width: 150px; height: 200px;" class="img-thumbin">
                        <p><%=b.getBookName()%></p>
                        <p><%=b.getAuthor()%></p>
                        <p><%=b.getBookCategory()%></p>
                            
                          <div class="row">
                            
                            <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-5">View Details</a>
                            <a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%></a>
                            
                            
                        </div>

                            
                            
                    </div>
                </div>
             </div>            
         
                        <%
                        }
                        %>
                
                
                     
        </div>
            
            <div class="text-center mt-1">
                <a href="all_old_book.jsp" class="btn btn-danger btn-sm">View All</a>
            </div>
            
    </div>
            
        
       <!<!-- End old Books --> 
       
       
       
       
        <%@include file="AllComponent/footer.jsp"%>
       
       
        
    </body>
</html>
