<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="CreateLogins.aspx.cs" Inherits="caslab12thapril.CreateLogins" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

      
    <div id="searchmaterail">
        <div class="row">
            <div class="col-md-12">
        
       <div class="col-md-6" >
                                         <h1 style="color:red;">Raw Material List</h1>
                                         </div>
                                       
                       
                </div>
            </div>
        </div>
  
      <div class="content-wrapper">
            <!-- Content Header (Page header) -->
           
            <!-- Main content -->
            <div class="content">
               <div class="row">
                  <div class="col-sm-12 col-md-12">
                     <div class="panel panel-bd lobidrag">
                      
                        <div class="panel-body" >

                                	<div  class="table-responsive" style="width:1100px; height:300px; overflow:auto;" >
<div >
                                        <asp:GridView ID="GridView1"   runat="server"  DataSourceID="SqlDataSource1" class="table table-striped table-bordered" AutoGenerateColumns="False" CellPadding="4"  ForeColor="#333333" GridLines="None"  >
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                               <asp:TemplateField HeaderText="Select">
																					 <HeaderTemplate>SELECT ALL:
<br/>
  <asp:RadioButton ID="chkAll" runat="server" />

</HeaderTemplate>
<ItemTemplate>
<%--<input name="RadioButton1" type="radio" value='<%# Eval("id") %>' onclick="javascript.myselection(this.id)" />--%>
  <asp:RadioButton runat="server" ID="RadioButton1"  OnCheckedChanged="RadioButton1_CheckedChanged"  />
</ItemTemplate>
</asp:TemplateField> <asp:BoundField DataField="EmpId" HeaderText="E-code" SortExpression="EmpId" />
                                                <asp:BoundField DataField="EmpName" HeaderText="Name" SortExpression="EmpName" />
                                                <asp:BoundField DataField="UserName" HeaderText="LoginID" SortExpression="UserName" />
                                                <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                                                <asp:BoundField DataField="compenymail" HeaderText="EmailID" SortExpression="compenymail" />
                                                 <asp:BoundField DataField="WorkLocation" HeaderText="WorkLocation" SortExpression="WorkLocation" />
                                                  <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status" />
                                                </Columns>
                                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                            <EditRowStyle BackColor="#999999" />
                                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />

                                        </asp:GridView>

                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MatreyPharmaConnectionString %>" SelectCommand="SELECT  id,EmpId ,EmpName,UserName,Password,compenymail,WorkLocation,status FROM  AddEmployee "></asp:SqlDataSource>
                                        <br />
                                        
																							</div>

  </div><br />

         
                              <div class="modal fade" id="addrawmaterial" tabindex="-1" role="dialog">
                  <div class="modal-dialog">
                     <div class="modal-content">
                        <div class="modal-header modal-header-primary">
                           <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                           <h3><i class="fa fa-plus m-r-5"></i> Create Logins </h3>
                        </div>
                        <div class="modal-body">
                           <div class="row">
                              <div class="col-md-12">
                                 <form class="form-horizontal">
                                    <fieldset>
                                       <!-- Text input-->
                                       <div class="col-md-6 form-group">
                                          <asp:label runat="server" class="control-label">E-Code</asp:label>
                                          <asp:DropDownList runat="server" ID="ecode" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="OnSelectedIndexChanged" ValidationGroup="addrawmaterial"   class="form-control">
                                              </asp:DropDownList>

                                       </div>
                                      
                                       <div class="col-md-6 form-group">
                                          <asp:label runat="server" class="control-label">Name</asp:label>
                                          <asp:textbox runat="server" ID="txtname"  ValidationGroup="addrawmaterial" ReadOnly="true"  type="text" placeholder="Name" class="form-control"/>
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red"  ValidationGroup="addrawmaterial"  runat="server" ControlToValidate="txtname" ErrorMessage="This Field Is Requried"></asp:RequiredFieldValidator>

                                       </div>
                                       
                                      
                                      
                                       <div class="col-md-6 form-group">
                                          <asp:label runat="server" class="control-label">Login Id</asp:label>
                                             <asp:TextBox runat="server" ID="txtlogin"  ValidationGroup="addrawmaterial"  class="form-control">
                                        <
                                             </asp:TextBox>
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" ValidationGroup="addrawmaterial" runat="server" ControlToValidate="txtlogin" ErrorMessage="This Field Is Requried"></asp:RequiredFieldValidator>

                                       </div>
                                            <div class="col-md-6 form-group">
                                                
                                          <asp:label runat="server" class="control-label">  Password </asp:label>
                                          <asp:textbox runat="server" ID="txtpass"  type="text" ValidationGroup="addrawmaterial" placeholder="Quantity" class="form-control"/>
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" ValidationGroup="addrawmaterial"  runat="server" ErrorMessage="This Field Is Requried" ControlToValidate="txtpass"></asp:RequiredFieldValidator>

                                        
                                          
                                        
                                       </div>
                                            <div class="col-md-6 form-group">
                                         <asp:label runat="server" class="control-label">Email Id</asp:label>
                                          <asp:TextBox runat="server" ID="email"   ValidationGroup="addrawmaterial"  class="form-control">
                                         
                                          </asp:TextBox>
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ForeColor="Red" ValidationGroup="addrawmaterial" ControlToValidate="email"  runat="server" ErrorMessage="This Field Is Requried"></asp:RequiredFieldValidator>

                                                </div>
									   

                                       <div class="col-md-12 form-group user-form-group">
                                          <div class="pull-right">
                                            
                                            <asp:Button runat="server" ID="Save" class="btn btn-primary" Text="Submit"  ValidationGroup="addrawmaterial" OnClick="Save_Click"  />
                                              <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal">Cancel</button>
                                          </div>
                                       </div>
                                    </fieldset>
                                 </form>
                              </div>
                           </div>
                        </div>
                        <%--<div class="modal-footer">
                           <button type="button" class="btn btn-danger pull-left" data-dismiss="modal">Close</button>
                        </div>--%>
                     </div>
                     <!-- /.modal-content -->
                  </div>
                  <!-- /.modal-dialog -->
               </div>
               <!-- /.modal -->
							
                            
            
         <div class="modal fade" id="addtask" tabindex="-1" role="dialog">
                  <div class="modal-dialog">
                     <div class="modal-content">
                        <div class="modal-header modal-header-primary">
                           <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                           <h3>Warning</h3>
                            <h5>Do You want to add RawMaterial to the list</h5>
                        </div>
                        <div class="modal-body">
                           <div class="row">
                              <div class="col-md-3">
                                 <div class="form-horizontal">
                                    <fieldset>
                                       <!-- Text input-->
                                
                                   
                                          
                                      <div class="col-md-12 form-group user-form-group">
                                          <div class="pull-right">
                                               <button type="button" data-dismiss="modal" class="btn btn-primary">Cancel</button>
                                            
                                          </div>
                                       </div>
                                        <div class="col-md-12 form-group user-form-group">
                                          <div class="pull-right">
                                                
                                            <button type="button" class="btn btn-primary" data-toggle="modal" data-dismiss="modal"  data-target="#addrawmaterial"><i class="fa fa-file-plus"></i> Add </button>

                                              </div>
                                        </div>
                                        
                                    </fieldset>
                                 </div>
                              </div>
                           </div>
                        </div>
                        
                     </div>
                     <!-- /.modal-content -->
                  </div>
                  <!-- /.modal-dialog -->
               </div>
               <!-- /.modal -->


                                   <div class="modal fade" id="listofrawmaterialedit" tabindex="-1" role="dialog">
                  <div class="modal-dialog">
                     <div class="modal-content">
                        <div class="modal-header modal-header-primary">
                           <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                           <h3><i class="fa fa-plus m-r-5"></i> Edit Material </h3>
                        </div>
                        <div class="modal-body">
                           <div class="row">
                              <div class="col-md-12">
                                 <div class="form-horizontal">
                                    <fieldset>
                                       <!-- Text input-->
                                       <div class="col-md-6 form-group">
                                          <asp:label runat="server" class="control-label">E-Code</asp:label>
                                          <asp:textbox runat="server" ID="editcode" ReadOnly="true" ValidationGroup="listofrawmaterialedit"  type="text" placeholder="Code" class="form-control"/>
                                       </div>
                                      
                                       <div class="col-md-6 form-group">
                                          <asp:label runat="server" class="control-label">Name</asp:label>
                                          <asp:textbox runat="server" ID="editname"   ValidationGroup="listofrawmaterialedit"  type="text" placeholder="Name" class="form-control"/>
                                       </div>
                                       
                                      
                                      
                                       <div class="col-md-6 form-group">
                                          <asp:label runat="server" class="control-label">User Id</asp:label>
                                           <asp:textbox runat="server" ID="editmaterial" ValidationGroup="listofrawmaterialedit"  type="text" placeholder="Name" class="form-control"/>
                                       </div>
                                            <div class="col-md-6 form-group">
                                                
                                          <asp:label runat="server" class="control-label">Password</asp:label>
                                          <asp:textbox runat="server" ID="editquantaity" ValidationGroup="listofrawmaterialedit"  type="text" placeholder="Quantity" class="form-control"/>
                                        
                                          
                                        
                                       </div>
									    <div class="col-md-6 form-group">
                                                
                                          <asp:label runat="server" class="control-label">Mail Id</asp:label>
                                          <asp:textbox runat="server" ID="editunits" ValidationGroup="listofrawmaterialedit"  type="text" placeholder="Units" class="form-control"/>
                                        
                                          
                                        
                                       </div>
                                            




                                       <div class="col-md-12 form-group user-form-group">
                                          <div class="pull-right">
                                            <button type="button" class="btn btn-primary"  data-toggle="modal" data-dismiss="modal"  data-target="#edit"><i class="fa fa-file-plus"></i> Submit </button>
                                              
                                            
                                          </div>
                                       </div>
                                    </fieldset>
                                 </div>
                              </div>
                           </div>
                        </div>
                        
                     </div>
                     <!-- /.modal-content -->
                  </div>
                  <!-- /.modal-dialog -->
               </div>
               <!-- /.modal -->
							


                           <div class="modal fade" id="edit" tabindex="-1" role="dialog">
                  <div class="modal-dialog">
                     <div class="modal-content">
                        <div class="modal-header modal-header-primary">
                           <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                           <h3>Warning</h3>
                            <h5>Do You want to Edit RawMaterial to the list</h5>
                        </div>
                        <div class="modal-body">
                           <div class="row">
                              <div class="col-md-3">
                                 <div class="form-horizontal">
                                    <fieldset>
                                       <!-- Text input-->
                                
                                   
                                          
                                       <div class="col-md-12 form-group user-form-group">
                                          <div class="pull-right">
                                               <button type="button" data-dismiss="modal" class="btn btn-danger btn-sm">Cancel</button>
                                           
                                             <asp:Button runat="server" ID="EditButton" class="btn btn-primary" Text="Edit"   CausesValidation="false" ValidationGroup="listofrawmaterialedit" OnClick="EditButton_Click" />
                                             

                                           <%-- <button type="button" class="btn btn-primary"  data-toggle="modal" data-dismiss="modal"  data-target="#listofrawmaterialedit"><i class="fa fa-file-plus"></i> Edit </button>--%>

                                          </div>
                                       </div>
                                    </fieldset>
                                 </div>
                              </div>
                           </div>
                        </div>
                        
                     </div>
                     <!-- /.modal-content -->
                  </div>
                  <!-- /.modal-dialog -->
               </div>
               <!-- /.modal -->





                    

                          

          <div class="buttonexport" id="buttons">
                                 
                             <%--<asp:Button ID="Button2" runat="server" Text="Edit" class="fa fa-file-text" CausesValidation="false" OnClick="Button2_Click"  />--%>

             <%--   <a href="#" class="btn btn-add" data-toggle="modal" data-target="#edit"><i class="fa fa-file-text"></i> Edit </a> --%>
               <asp:Button runat="server" ID="editpopup" class="btn btn-primary" ValidationGroup="buttons" Text="Edit" data-toggle="modal" OnClick="editpopup_Click" data-target="#listofrawmaterialedit" />
              <asp:Button runat="server" Text="Unlock" ID="unlock" class="btn btn-primary"  ValidationGroup="buttons" CausesValidation="false" OnClick="unlock_Click" />
                             <%--  <a href="#" class="btn btn-add" data-toggle="modal" data-target="#"><i class="fa fa-file-text"></i> Export </a> --%>
                             <%--  <a href="#" class="btn btn-add" data-toggle="modal" data-target="#"><i class="fa fa-file-text"></i> Disable/Enable </a>--%> 

    

                              <%-- <a href="#" class="btn btn-add" data-toggle="modal" data-target="#Replace"><i class="fa fa-file-text"></i> Replace </a> --%>
                                       
              
                                            <button type="button" class="btn btn-primary"  data-toggle="modal" data-dismiss="modal"  data-target="#addtask"><i class="fa fa-file-plus"></i> Add </button>
								
                              </div>
                     
                     </div>
                  </div>
               </div>
            </div>
            <!-- /.content -->
         </div>
         <!-- /.content-wrapper -->
                                        </div>

  <script language="javascript" type="text/javascript">
        function myselection(rbtnid) {
            var rbtn = document.getElementById(rbtnid);
            var rbtnlist = document.getElementsByTagName("input");
            for (i = 0; i < rbtnlist.length; i++) {
                if (rbtnlist[i].text == "radio" && rbtnlist[i].id != rbtn.id) {
                    rbtnlist[i].checked = false;
                    

                }
            }
        }
    </script>

    <script type="text/javascript">  
            function CheckOtherIsCheckedByGVID(spanChk) {  
                var IsChecked = spanChk.checked;  
                if (IsChecked) {                   
                    //spanChk.parentElement.parentElement.style.backgroundColor = '';  
                   // spanChk.parentElement.parentElement.style.color = 'white';  
                }  
                var CurrentRdbID = spanChk.id;  
                var Chk = spanChk;  
                Parent = document.getElementById("<%=GridView1.ClientID%>");  
                var items = Parent.getElementsByTagName('input');  
                for (i = 0; i < items.length; i++) {  
                    if (items[i].id != CurrentRdbID && items[i].type == "radio") {  
                        if (items[i].checked) {  
                            items[i].checked = false;
                            items[i].parentElement.parentElement.style.backgroundColor = 'white'   
                            items[i].parentElement.parentElement.style.color = 'black';  
                        }  
                    }  
                }  
            }  
</script>  
</asp:Content>
