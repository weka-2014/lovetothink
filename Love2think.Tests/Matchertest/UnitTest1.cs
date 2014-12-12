using System;
using System.Diagnostics;
using Love2think.Controllers;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Love2think.Tests.Matchertest
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void TestMethod1()
        {
            //arrange
            string str1 = "bob";
            string str2 = "babybabybaybee";
            

            //execute
            int distance = GetMatches.LevenshteinDistance(str1, str2);
            //assert
            Debug.WriteLine(distance);

            Assert.AreEqual(2, distance);

        }
    }
}
