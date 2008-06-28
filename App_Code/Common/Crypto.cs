using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
/////////////////////////////////////
using System.Text;
using System.Security.Cryptography;
/////////////////////////////////////


public class Crypto
{
	public Crypto()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    /// <summary>
    /// used to encript string 
    /// </summary>
    /// <param name="CypherText">Text which is for encryption</param>
    /// <returns></returns>

    public static string EnCrypto(string CypherText)
    {
        byte[] byteKeyArray;
        byte[] byteCypherTextArray = UTF8Encoding.UTF8.GetBytes(CypherText);

        System.Configuration.AppSettingsReader objAppSettingsReader = new AppSettingsReader();


        string strKey = "keyformatrimonial";
        MD5CryptoServiceProvider objMD5CryptoServiceProvider = new MD5CryptoServiceProvider();
        byteKeyArray = objMD5CryptoServiceProvider.ComputeHash(UTF8Encoding.UTF8.GetBytes(strKey));
        objMD5CryptoServiceProvider.Clear();


        TripleDESCryptoServiceProvider objTDESCServiceProvider = new TripleDESCryptoServiceProvider();
        objTDESCServiceProvider.Key = byteKeyArray;
        objTDESCServiceProvider.Mode = CipherMode.ECB; 
        objTDESCServiceProvider.Padding = PaddingMode.PKCS7;

        ICryptoTransform objICryptoTransform = objTDESCServiceProvider.CreateEncryptor();
        byte[] byteResultArray = objICryptoTransform.TransformFinalBlock(byteCypherTextArray, 0, byteCypherTextArray.Length);
        objTDESCServiceProvider.Clear();
        return Convert.ToBase64String(byteResultArray, 0, byteResultArray.Length);

    }

    public static string DeCrypto(string CypherText)
    {
        try
        {
            byte[] byteKeyArray;
            byte[] byteCypherTextArray = Convert.FromBase64String(CypherText);

            System.Configuration.AppSettingsReader objAppSettingsReader = new AppSettingsReader();
            //Get your key from config file to open the lock!

            string strKey = "keyformatrimonial";
            MD5CryptoServiceProvider objMD5CryptoServiceProvider = new MD5CryptoServiceProvider();
            byteKeyArray = objMD5CryptoServiceProvider.ComputeHash(UTF8Encoding.UTF8.GetBytes(strKey));
            objMD5CryptoServiceProvider.Clear();

            TripleDESCryptoServiceProvider objTDESCServiceProvider = new TripleDESCryptoServiceProvider();
            objTDESCServiceProvider.Key = byteKeyArray;
            objTDESCServiceProvider.Mode = CipherMode.ECB;
            objTDESCServiceProvider.Padding = PaddingMode.PKCS7;

            ICryptoTransform cTransform = objTDESCServiceProvider.CreateDecryptor();
            byte[] byteResultArray = cTransform.TransformFinalBlock(byteCypherTextArray, 0, byteCypherTextArray.Length);

            objTDESCServiceProvider.Clear();
            return UTF8Encoding.UTF8.GetString(byteResultArray);
        }
        catch(Exception)
        {
            return null;
        }
    }
}
