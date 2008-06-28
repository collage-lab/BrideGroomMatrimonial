//Class Used For Creating Random String Of Lengthm n to m



using System;
using System.Collections.Generic;
using System.Text;
//<------------------------------>
using System.Security.Cryptography;

    public class RandomString
    {
        #region " Defenition"
        // Define default min and max STRING lengths.
        private static int intDefaultRSLengthMin = 5;
        private static int intDefaultRSLengthMax = 10;

        // Define supported charRandomString characters divided into groups.
        private static string stringCharLCase = "abcdefgijkmnopqrstwxyz";
        private static string stringCharUCase = "ABCDEFGHJKLMNPQRSTWXYZ";
        private static string stringCharNumeric = "23456789";
        private static string stringCharSpecial = "prasanth";// "*$-+?_&=!%{}/"; //desabled becoz of usin in web
        #endregion

        #region"Generate Methode"

        // Default Methode
        public static string Generate()
        {
            return Generate(intDefaultRSLengthMin, intDefaultRSLengthMax);
        }
        // Methode  were min = max
        public static string Generate(int length)
        {
            return Generate(length, length);
        }
        //
        public static string Generate(int MinLength, int MaxLength)
        {
            // Makeing sure that input parameters are valid.
            if (MinLength <= 0 || MaxLength <= 0 || MinLength > MaxLength)
                return null;

            // Createating a local array containing supported charRandomString characters grouped by types.
            char[][] charAGroups = new char[][] 
                {
                    stringCharLCase.ToCharArray(),
                    stringCharUCase.ToCharArray(),
                    stringCharNumeric.ToCharArray(),
                    stringCharSpecial.ToCharArray()
                };

            // Use this array to track the number of unused characters in each
            // character group.
            int[] intACharsLeftInGroup = new int[charAGroups.Length];

            // Initially, all characters in each group are not used.
            for (int i = 0; i < intACharsLeftInGroup.Length; i++)
                intACharsLeftInGroup[i] = charAGroups[i].Length;

            // Use this array to track (iterate through) unused character groups.
            int[] intALeftGroupsOrder = new int[charAGroups.Length];

            // Initially, all character groups are not used.
            for (int i = 0; i < intALeftGroupsOrder.Length; i++)
                intALeftGroupsOrder[i] = i;

            // Because we cannot use the default randomizer, which is based on the
            // current time (it will produce the same "objRandom" number within a
            // second), we will use a objRandom number generator to seed the
            // randomizer.

            // Use a 4-byte array to fill it with objRandom bytes and convert it then
            // to an integer value.
            byte[] byteARandomBytes = new byte[4];

            // Generate 4 objRandom bytes.
            RNGCryptoServiceProvider objRNGCryptoProvider = new RNGCryptoServiceProvider();
            objRNGCryptoProvider.GetBytes(byteARandomBytes);

            // Convert 4 bytes into a 32-bit integer value.
            int intSeed = (byteARandomBytes[0] & 0x7f) << 24 |
                        byteARandomBytes[1] << 16 |
                        byteARandomBytes[2] << 8 |
                        byteARandomBytes[3];

            // Now, this is real randomization.
            Random objRandom = new Random(intSeed);

            // This array will hold charRandomString characters.
            char[] charRandomString = null;

            // Allocate appropriate memory for the charRandomString.
            if (MinLength < MaxLength)
                charRandomString = new char[objRandom.Next(MinLength, MaxLength + 1)];
            else
                charRandomString = new char[MinLength];

            // Index of the next character to be added to charRandomString.
            int intNextCharIdx;

            // Index of the next character group to be processed.
            int intNextGroupIdx;

            // Index which will be used to track not processed character groups.
            int intNextLeftGroupsOrderIdx;

            // Index of the last non-processed character in a group.
            int intLastCharIdx;

            // Index of the last non-processed group.
            int intLastLeftGroupsOrderIdx = intALeftGroupsOrder.Length - 1;

            // Generate charRandomString characters one at a time.
            for (int i = 0; i < charRandomString.Length; i++)
            {
                // If only one character group remained unprocessed, process it;
                // otherwise, pick a objRandom character group from the unprocessed
                // group list. To allow a special character to appear in the
                // first position, increment the second parameter of the Next
                // function call by one, i.e. intLastLeftGroupsOrderIdx + 1.
                if (intLastLeftGroupsOrderIdx == 0)
                    intNextLeftGroupsOrderIdx = 0;
                else
                    intNextLeftGroupsOrderIdx = objRandom.Next(0,
                                                         intLastLeftGroupsOrderIdx);

                // Get the actual index of the character group, from which we will
                // pick the next character.
                intNextGroupIdx = intALeftGroupsOrder[intNextLeftGroupsOrderIdx];

                // Get the index of the last unprocessed characters in this group.
                intLastCharIdx = intACharsLeftInGroup[intNextGroupIdx] - 1;

                // If only one unprocessed character is left, pick it; otherwise,
                // get a objRandom character from the unused character list.
                if (intLastCharIdx == 0)
                    intNextCharIdx = 0;
                else
                    intNextCharIdx = objRandom.Next(0, intLastCharIdx + 1);

                // Add this character to the charRandomString.
                charRandomString[i] = charAGroups[intNextGroupIdx][intNextCharIdx];

                // If we processed the last character in this group, start over.
                if (intLastCharIdx == 0)
                    intACharsLeftInGroup[intNextGroupIdx] =
                                              charAGroups[intNextGroupIdx].Length;
                // There are more unprocessed characters left.
                else
                {
                    // Swap processed character with the last unprocessed character
                    // so that we don't pick it until we process all characters in
                    // this group.
                    if (intLastCharIdx != intNextCharIdx)
                    {
                        char temp = charAGroups[intNextGroupIdx][intLastCharIdx];
                        charAGroups[intNextGroupIdx][intLastCharIdx] =
                                    charAGroups[intNextGroupIdx][intNextCharIdx];
                        charAGroups[intNextGroupIdx][intNextCharIdx] = temp;
                    }
                    // Decrement the number of unprocessed characters in
                    // this group.
                    intACharsLeftInGroup[intNextGroupIdx]--;
                }

                // If we processed the last group, start all over.
                if (intLastLeftGroupsOrderIdx == 0)
                    intLastLeftGroupsOrderIdx = intALeftGroupsOrder.Length - 1;
                // There are more unprocessed groups left.
                else
                {
                    // Swap processed group with the last unprocessed group
                    // so that we don't pick it until we process all groups.
                    if (intLastLeftGroupsOrderIdx != intNextLeftGroupsOrderIdx)
                    {
                        int temp = intALeftGroupsOrder[intLastLeftGroupsOrderIdx];
                        intALeftGroupsOrder[intLastLeftGroupsOrderIdx] =
                                    intALeftGroupsOrder[intNextLeftGroupsOrderIdx];
                        intALeftGroupsOrder[intNextLeftGroupsOrderIdx] = temp;
                    }
                    // Decrement the number of unprocessed groups.
                    intLastLeftGroupsOrderIdx--;
                }
            }

            // Convert charRandomString characters into a string and return the result.
            return new string(charRandomString);
        }

        #endregion

        #region "Public Methodes"
        public static  string GenerateStirng(int Size, bool ISLowerCase)
        {
            StringBuilder objStringBulder = new StringBuilder();
            Random objRandom = new Random();
            char charTemp;
            for (int i = 0; i < Size; i++)
            {
                charTemp = Convert.ToChar(Convert.ToInt32(Math.Floor(26 * objRandom.NextDouble() + 65)));
                objStringBulder.Append(charTemp);
            }
            if (ISLowerCase)
                return objStringBulder.ToString().ToLower();

            return objStringBulder.ToString();

        }


        #endregion
    }
