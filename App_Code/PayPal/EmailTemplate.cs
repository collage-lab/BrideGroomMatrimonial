using System;
using System.Web.Mail;
using System.Configuration;
using System.Collections;
using System.Xml;
using System.Net.Mail;


	/// <summary>
	/// Summary description for Email.
	/// </summary>
	public class EmailTemplate
	{
		protected Hashtable variablesToReplace = new Hashtable();
       
        public EmailTemplate()
        {
           	
        }

		

		public EmailTemplate(string xmlTemplateFileName) 
		{
			
			string xmlPath = System.Web.Configuration.WebConfigurationManager.AppSettings["contentPath"] + xmlTemplateFileName;
			
			XmlDocument doc = new XmlDocument();
			doc.Load(xmlPath);
			XmlNodeList nodeLst = doc.GetElementsByTagName("email");
			XmlNode contactNode = nodeLst[0]; //get first node (assume exactly one)

			foreach (XmlNode node in contactNode.ChildNodes) 
			{
				switch (node.Name.ToLower()) 
				{
					case "email_to":
						this.EmailTo = node.InnerText;
						break;
					case "email_from":
						this.EmailFrom = node.InnerText;
						break;
					case "email_bcc":
						this.EmailBcc = node.InnerText;
						break;
					case "email_subject":
						this.EmailSubject = node.InnerText;
						break;
					case "email_body":
						this.EmailBody = node.InnerText;
						break;
					case "email_signature":
						this.EmailSignature = node.InnerText;
						break;
					default:
						break;
				}	//end switch			
			} //loop thru childnodes	
			
		}

		#region Properties

        private bool _isHtml = true;
        public bool IsHtml 
		{
			set 
			{
                _isHtml = value;
			}
			get 
			{
                return _isHtml;
			}
		}

		protected string _emailSignature = "";
		public string EmailSignature 
		{
			get 
			{
				return _emailSignature;
			}
			set 
			{
				_emailSignature = value;
			}
		}

        private string _emailTo = "";
		public string EmailTo 
		{
			get 
			{
                return _emailTo;
			}
			set 
			{
                _emailTo = value;
			}
		}

        public string _emailBcc = "";
		public string EmailBcc 
		{
			get 
			{
                return _emailBcc;
			}
			set 
			{
                _emailBcc = value;
			}
		}

        private string _emailFrom = "";
		public string EmailFrom 
		{
			get 
			{
                return _emailFrom;
			}
			set 
			{
                _emailFrom = value;
			}
		}

        public string _emailSubject = "";
		public string EmailSubject 
		{
			get 
			{
                return _emailSubject;
			}
			set 
			{
                _emailSubject = value;
			}
		}

		protected string _emailBody = "";
		public string EmailBody 
		{
			get 
			{
				return _emailBody;
			}
			set 
			{
				_emailBody = value;
			}
		}

		#endregion

		public void Send() 
		{
			ReplaceVariables();
			try 
			{
                //try recommended method
                System.Net.Mail.MailMessage myMail;
                System.Net.Mail.SmtpClient mailClient;
                 
                myMail = new System.Net.Mail.MailMessage(
                          this.EmailFrom
                        , this.EmailTo
                        , this.EmailSubject
                        , EmailBody + EmailSignature);
                if (this.EmailBcc != "")
                {
                    myMail.Bcc.Add(this.EmailBcc);
                }
                myMail.IsBodyHtml = this.IsHtml;
                mailClient = new System.Net.Mail.SmtpClient(System.Web.Configuration.WebConfigurationManager.AppSettings["smtp server"].ToString(), int.Parse(System.Web.Configuration.WebConfigurationManager.AppSettings["smtp server port"].ToString()));
                mailClient.Send(myMail);
			} 
			catch 
			{
                try
                {
                    //try old method
                    System.Web.Mail.MailMessage myMail2;
                    
                    myMail2 = new System.Web.Mail.MailMessage();
                    myMail2.From = this.EmailFrom;
                    myMail2.To = this.EmailTo;
                    myMail2.Subject = this.EmailSubject;
                    myMail2.Body = EmailBody + EmailSignature;
                    myMail2.BodyFormat = System.Web.Mail.MailFormat.Html;

                    SmtpMail.Send(myMail2);

                }
                catch (Exception ex)
                {
                    //string errHelp = "Problem sending email TO:" + this.EmailTo + ", FROM: " + this.EmailFrom;
                    //LogWriter.WriteLog("EmailTemplate.Send", errHelp + ex.ToString());
                    //do nothing
                }
			}
		}

		private void ReplaceVariables() 
		{
			foreach(string key in  variablesToReplace.Keys) 
			{
				string thisVariable = key.ToString();
				string thisValue = (string)variablesToReplace[thisVariable];
				
				this.EmailBody = this.EmailBody.Replace(thisVariable,thisValue);
				this.EmailFrom = this.EmailFrom.Replace(thisVariable,thisValue);
				this.EmailTo = this.EmailTo.Replace(thisVariable,thisValue);
				this.EmailSubject = this.EmailSubject.Replace(thisVariable,thisValue);
				this.EmailSignature = this.EmailSignature.Replace(thisVariable,thisValue);
			}
		}


		/// <summary>
		/// PURPOSE: to add a variable to the list (to do replaces on from the template)
		/// </summary>
		/// <param name="variableName"></param>
		/// <param name="variableValue"></param>
		public void AddVariable(string variableName, string variableValue) 
		{
			if (!variablesToReplace.ContainsKey(variableName)) 
			{
				//assert: haven't added this yet
				variablesToReplace.Add(variableName,variableValue);
			}
		}

        //public void AddAttachment(string fileNameToAttach) 
        //{
        //    emailMsg.Attachments.Add(new MailAttachment(System.Web.Configuration.WebConfigurationManager.AppSettings["contentPath"]+@"Minutes\" + fileNameToAttach));	
        //}


	}

