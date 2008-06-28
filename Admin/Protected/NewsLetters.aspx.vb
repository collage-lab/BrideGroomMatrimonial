
Partial Class Admin_Protected_NewsLetters
    Inherits System.Web.UI.Page
    Public sContent As String = ""

    Public Enum MailType
        Newstetter
        SupportMail
        NewProduct
        ToAll
        TOActiveMembers
        ToInActiveMembers
        TOPaidMembers
    End Enum


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ' Set image for diffrent sittuations 

        If Not IsPostBack Then
            Select Case Request.QueryString("id")

                Case "0"    ' To all
                    Img_icon.ImageUrl = "../../Resources/mail-Group32.gif"
                    DDL_Member.SelectedIndex = 0
                Case "1"    ' To Paid Members
                    Img_icon.ImageUrl = "../../Resources/mail-paid32.gif"
                    HF_MailType.Value = "1"
                    DDL_Member.SelectedIndex = 3

                Case "2"    'TO Active Members
                    Img_icon.ImageUrl = "../../Resources/mail-Active32.gif"
                    DDL_Member.SelectedIndex = 1
                    HF_MailType.Value = "2"

                Case "3"    'To Inactive
                    Img_icon.ImageUrl = "../../Resources/mail-inactive32.gif"
                    DDL_Member.SelectedIndex = 2
                    HF_MailType.Value = "3"
                Case "4"    'To MemBerID
                    Img_icon.ImageUrl = "../../Resources/mail-ID32.gif"
                    DDL_Member.Visible = False
                    TB_ID.Visible = True
                    L_ID.Visible = True
                    L_ID.Text = "Matrimonial ID"
                    RFV_MemID.Enabled = True
                    HF_MailType.Value = "4"
                Case "5"   'TO Email ID
                    Img_icon.ImageUrl = "../../Resources/mail-ID32.gif"
                    DDL_Member.Visible = False
                    TB_ID.Visible = True
                    TB_ID.Text = Request.QueryString("mailto")
                    L_ID.Visible = True
                    L_ID.Text = " email address"
                    RFV_MemID.Enabled = True
                    HF_MailType.Value = "5"


                    TB_ID.Text = Request.QueryString("mailto")

                Case "6"  'News Letters
                    Img_icon.ImageUrl = "../../Resources/mail-ID32.gif"
                    DDL_Member.Visible = False
                    TB_ID.Visible = True
                    L_ID.Visible = True
                    RFV_MemID.Enabled = True
                    HF_MailType.Value = "6"
                Case "7"  'Promotional Mails
                    Img_icon.ImageUrl = "../../Resources/mail-ID32.gif"
                    DDL_Member.Visible = False
                    TB_ID.Visible = True
                    L_ID.Visible = True
                    RFV_MemID.Enabled = True
                    HF_MailType.Value = "7"
                Case "8"  'New Products
                    Img_icon.ImageUrl = "../../Resources/mail-ID32.gif"
                    DDL_Member.Visible = False
                    TB_ID.Visible = True
                    L_ID.Visible = True
                    RFV_MemID.Enabled = True
                    HF_MailType.Value = "8"
                Case Else
                    Img_icon.ImageUrl = "../../Resources/mail-Group32.gif"
                    DDL_Member.SelectedIndex = 0
                    DDL_Member.Enabled = True
                    HF_MailType.Value = "0"
            End Select


            ' Configuring Rich Text Control:


            If Request.Form("rte1") = "" Then
                sContent = """Type Your Message here</b>"""
                sContent = RTESafe(sContent)
            Else
                sContent = RTESafe(Request.Form("rte1"))
            End If
        Else
            ' Send Mail
            Select Case HF_MailType.Value
                Case "0"
                    EmailManager.SendBulkMail(MatrimonialMessanger.MailingType.ToAll, WebConfig.GetValues(WebConfig.ConfigurationItem.emailFrom), MatrimonialMessanger.GetMailingList(MatrimonialMessanger.MailingType.ToAll), TB_Subject.Text, sContent)
                Case "1"
                    EmailManager.SendBulkMail(MatrimonialMessanger.MailingType.TOPaidMembers, WebConfig.GetValues(WebConfig.ConfigurationItem.emailFrom), MatrimonialMessanger.GetMailingList(MatrimonialMessanger.MailingType.ToAll), TB_Subject.Text, sContent)
                Case "2"
                    EmailManager.SendBulkMail(MatrimonialMessanger.MailingType.TOActiveMembers, WebConfig.GetValues(WebConfig.ConfigurationItem.emailFrom), MatrimonialMessanger.GetMailingList(MatrimonialMessanger.MailingType.ToAll), TB_Subject.Text, sContent)
                Case "3"
                    EmailManager.SendBulkMail(MatrimonialMessanger.MailingType.ToInActiveMembers, WebConfig.GetValues(WebConfig.ConfigurationItem.emailFrom), MatrimonialMessanger.GetMailingList(MatrimonialMessanger.MailingType.ToAll), TB_Subject.Text, sContent)
                Case "4"
                    EmailManager.SendMail(MatrimonialMemberShip.GetUserName(TB_ID.Text, True), WebConfig.GetValues(WebConfig.ConfigurationItem.emailFrom), TB_Subject.Text, sContent)
                Case "5"
                    EmailManager.SendMail(TB_ID.Text, WebConfig.GetValues(WebConfig.ConfigurationItem.emailFrom), TB_Subject.Text, sContent)
                Case "6"
                    EmailManager.SendBulkMail(MatrimonialMessanger.MailingType.Newstetter, WebConfig.GetValues(WebConfig.ConfigurationItem.emailFrom), MatrimonialMessanger.GetMailingList(MatrimonialMessanger.MailingType.Newstetter), TB_Subject.Text, sContent)
                Case "7"
                    EmailManager.SendBulkMail(MatrimonialMessanger.MailingType.SupportMail, WebConfig.GetValues(WebConfig.ConfigurationItem.emailFrom), MatrimonialMessanger.GetMailingList(MatrimonialMessanger.MailingType.SupportMail), TB_Subject.Text, sContent)
                Case "8"
                    EmailManager.SendBulkMail(MatrimonialMessanger.MailingType.NewProduct, WebConfig.GetValues(WebConfig.ConfigurationItem.emailFrom), MatrimonialMessanger.GetMailingList(MatrimonialMessanger.MailingType.NewProduct), TB_Subject.Text, sContent)
            End Select

        End If

    End Sub



#Region "Member Functions"
    Protected Function RTESafe(ByVal strText As String) As String
        'returns safe code for preloading in the RTE
        Dim tmpString As String = ""

        tmpString = Trim(strText)

        'convert all types of single quotes
        tmpString = Replace(tmpString, Chr(145), Chr(39))
        tmpString = Replace(tmpString, Chr(146), Chr(39))
        tmpString = Replace(tmpString, "'", "&#39;")

        'convert all types of double quotes
        tmpString = Replace(tmpString, Chr(147), Chr(34))
        tmpString = Replace(tmpString, Chr(148), Chr(34))
        'tmpString = replace(tmpString, """", "\""")

        'replace carriage returns & line feeds
        tmpString = Replace(tmpString, Chr(10), " ")
        tmpString = Replace(tmpString, Chr(13), " ")

        RTESafe = tmpString
    End Function
#End Region



    Protected Sub B_Submit_Click(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub



    Protected Sub BulkMail(ByVal FromAddress As String, ByVal TOAddress As String(), ByVal Subject As String, ByVal Body As String)

    End Sub


    Protected Sub SendMail(ByVal FromAddress As String, ByVal TOAddress As String, ByVal Subject As String, ByVal Body As String)

    End Sub



End Class
