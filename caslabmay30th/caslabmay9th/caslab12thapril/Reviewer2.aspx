<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Reviewer2.aspx.cs" Inherits="caslab12thapril.Reviewer2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
      <div class="col-lg-11">
  <br/><asp:TextBox runat="server" ID="memployee"   Visible="false" class="form-control"></asp:TextBox> 
          <asp:TextBox ID="emailbox" Visible="false" runat="server" />
	  <asp:label style="float:right;" runat="server" id="approverdata" Visible="false"></asp:label>
	  <br/>
          <asp:Label ID="taskid" runat="server" Visible="false" />
          <div class="col-lg-6">
          <asp:GridView ID="GridView1" runat="server" style="margin-left:250px;margin-top:100px" class="table table-striped table-bordered" AutoGenerateColumns="False" OnRowDataBound="GridView1_RowDataBound"  BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" DataSourceID="SqlDataSource3">
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>
                       
                        <asp:BoundField DataField="TaskId" HeaderText="TaskId"  SortExpression="TaskId" />
                        <asp:BoundField DataField="Reviewerstatus" HeaderText="Reviewer status" SortExpression="Reviewerstatus"/>
                         <asp:BoundField DataField="Status" HeaderText="Approver status" SortExpression="Status"/>
                      
                    </Columns>
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <SortedAscendingCellStyle BackColor="#F4F4FD" />
                    <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                    <SortedDescendingCellStyle BackColor="#D8D8F0" />
                    <SortedDescendingHeaderStyle BackColor="#3E3277" />
                </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:MatreyPharmaConnectionString %>" SelectCommand="SELECT distinct [TaskId], [Reviewerstatus], [Status] FROM [Inboxdetails] WHERE ([EmployeeName] = @EmployeeName) and ([TaskId] = @TaskId)">
            <SelectParameters>
                <asp:SessionParameter Name="EmployeeName" SessionField="UserName" Type="String" />
            </SelectParameters>
            <SelectParameters>
                <asp:SessionParameter Name="TaskId" SessionField="TaskId" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
              </div>
          <div class="col-lg-4">
      <asp:label runat="server" id="taskidlabel" style="float:right;" for="sel1" >TaskId</asp:label>
           
      </div>
    <div class="col-lg-4">
      
        <asp:TextBox runat="server" ID="label10" class="form-control"></asp:TextBox>
  
      </div><br /><br />
          
          <div class="col-lg-4">
      <asp:label  runat="server" id="commentbox" style="float:right;" for="sel1">Comments::</asp:label>
           
      </div>
          <div class="col-lg-4">
      
        <asp:TextBox runat="server" TextMode="multiline"  ID="reviewercomments" class="form-control"></asp:TextBox>
           
      </div>
             <div class="col-lg-4">
      <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" style="margin-top:20px">
                    <asp:ListItem>ACCEPT</asp:ListItem>
                    <asp:ListItem style="margin-left:30px">REJECT</asp:ListItem>
                </asp:RadioButtonList>
                   
                          <asp:Button ID="testbutton" runat="server" Text="save" style="margin-left:200px;margin-top:-46px" class="btn btn-primary" OnClick="testbutton_Click" />
           <asp:Button ID="finalsave" runat="server" Text="save" style="margin-left:260px;margin-top:-46px" class="btn btn-primary" OnClick="finalsave_Click"  />
                     
        
                   
      </div>
          <br />
          
  

	  <div class="col-lg-4">
      <asp:label runat="server" style="float:right;" id="reviewerdata"  for="sel1">reviewer</asp:label>
      
      </div>
    <div class="col-lg-4">
      
        <asp:DropDownList runat="server" ID="reviewer" class="form-control" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="UserName" DataValueField="UserName">

                                </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MatreyPharmaConnectionString %>" SelectCommand="SELECT [UserName] FROM [AddEmployee] WHERE ([position] = @position)">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="Reviewer" Name="position" QueryStringField="Reviewer" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
      </div>
          <br/>
	  <br/>
    <br />
        <div class="col-lg-4">
      <asp:label  runat="server" id="approverlabel" style="float:right;" for="sel1">Approver</asp:label>
      
      </div>
    <div class="col-lg-4">
      
       <asp:DropDownList runat="server" ID="approver" class="form-control" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="UserName" DataValueField="UserName">

                                </asp:DropDownList>
     
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MatreyPharmaConnectionString %>" SelectCommand="SELECT [UserName] FROM [AddEmployee] WHERE ([position] = @position)">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="Approver" Name="position" QueryStringField="Approver" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
     
      </div>
          <br />
          <br/>
	  <br/>
        
          <div class="col-lg-4">
      <asp:label  runat="server" id="list" style="float:right;" for="sel1">Distributors list</asp:label>
           
      </div>

    <div class="col-lg-4">
      
        <asp:TextBox runat="server" ID="distributor" class="form-control"></asp:TextBox><br />
 	
      </div>
          <asp:label runat="server" ID="datelabel" style="float:right;" for="sel1" Visible="false"></asp:label>
<br /><br/>
	  <br/><br /><br />
     
       <div class="col-lg-6">
           <asp:Button runat="server" ID="submit"   Text="Submit"   style="margin-left:430px" class="btn btn-primary" OnClick="submit_Click1"  />            
                       </div>
          <br />
         <div class="col-lg-6">
             
             <asp:label ID="taskstatus" visible="false" runat="server"></asp:label>
              
    <asp:label ID="frontpagedata" visible="false" runat="server"></asp:label>
              <asp:label ID="editorpage" visible="false" runat="server"></asp:label>
               <div class="col-lg-4">
      <asp:label runat="server" ID="usernamelabel" style="float:right;" for="sel1" Visible="false">Username</asp:label>
       <asp:label style="float:right;" runat="server" id="labeldata" Visible="false"></asp:label>
      </div>
    <div class="col-lg-4">
   <asp:TextBox runat="server" ID="usernamedata"   class="form-control" Visible="false"></asp:TextBox> 
           <asp:label  runat="server" id="userdata" Visible="false"  ></asp:label>
       <asp:label  runat="server" id="newreviewerdata" Visible="false"  ></asp:label>
        <asp:label  runat="server" id="newtaskid"  Visible="false"></asp:label>
       <asp:label  runat="server" id="newtaskstatus"  Visible="false"></asp:label> 
      </div>
	  <br/>
	  <br/>
	  <br/>

             </div>



</asp:Content>
