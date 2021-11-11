<!DOCTYPE html>
<%@ Page Language="C#" %>
<%@ Register tagprefix="SharePoint" namespace="Microsoft.SharePoint.WebControls" assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<html dir="ltr" xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

  <title>AJG Demo</title>

  <SharePoint:CssRegistration Name="default" runat="server" />

  <link href='css/bootstrap.min.css' rel='stylesheet' type='text/css' />
  <link href='css/features.css' rel='stylesheet' type='text/css' />
  <link href='css/all.min.css' rel='stylesheet' type='text/css' />
  <link href='css/animate.css' rel='stylesheet' type='text/css' />
  <link rel="icon" href="favicon.ico" />

  <style>
    .bd-placeholder-img {
      font-size: 1.125rem;
      text-anchor: middle;
      -webkit-user-select: none;
      -moz-user-select: none;
      user-select: none;
    }

    @media (min-width: 768px) {
      .bd-placeholder-img-lg {
        font-size: 3.5rem;
      }
    }
  </style>
</head>

<body>
  <form id="form1" runat="server">
    <!--Redirect to error page if using Internet Explorer-->

    <div id="ajgDemo" class="wrapper">
    


      <div class="container px-4 py-5" id="custom-cards">
        <h2 class="pb-2 border-bottom">Simple Page Retrieving Data From a <a href="/sites/AJG-Demo/Lists/SectionsPages/AllItems.aspx" target="_blank" rel="noopener noreferrer">SharePoint List</a> </h2>

        <div class="row row-cols-1 row-cols-lg-3 align-items-stretch g-4 py-5">
          <div class="col" v-for="item in listData">
            <div class="card card-cover h-100 overflow-hidden text-white bg-dark rounded-5 shadow-lg"
              style="background-image: radial-gradient(circle at 77% 43%, rgba(168, 168, 168,0.04) 0%, rgba(168, 168, 168,0.04) 50%,rgba(10, 10, 10,0.04) 50%, rgba(10, 10, 10,0.04) 100%),radial-gradient(circle at 33% 65%, rgba(248, 248, 248,0.04) 0%, rgba(248, 248, 248,0.04) 50%,rgba(228, 228, 228,0.04) 50%, rgba(228, 228, 228,0.04) 100%),radial-gradient(circle at 92% 79%, rgba(152, 152, 152,0.04) 0%, rgba(152, 152, 152,0.04) 50%,rgba(28, 28, 28,0.04) 50%, rgba(28, 28, 28,0.04) 100%),radial-gradient(circle at 91% 13%, rgba(41, 41, 41,0.04) 0%, rgba(41, 41, 41,0.04) 50%,rgba(214, 214, 214,0.04) 50%, rgba(214, 214, 214,0.04) 100%),linear-gradient(90deg, rgb(11, 127, 96),rgb(139, 205, 191));">
              <div class="d-flex flex-column h-100 p-5 pb-3 text-white text-shadow-1">
                <h2 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold">{{item.Title}}</h2>
                <ul class="d-flex list-unstyled mt-auto">
                  <li class="me-auto">
                  Section: {{item.Section}}
                  </li>
                  <li class="d-flex align-items-center me-3">
                   
                    
                  </li>
                  <li class="d-flex align-items-center">
                    
                    <small>Page: {{item.Page}}</small>
                  </li>
                </ul>
              </div>
            </div>
          </div>

          
        </div>
      </div>

      
    </div>


  </form>
  <script src="js/bootstrap.bundle.min.js"></script>
  <script src="js/vue.js"></script>
  <script src="js/axios.min.js"></script>
  <script src="js/list.js"></script>
</body>

</html>