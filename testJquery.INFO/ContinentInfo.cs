using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace testJquery
{
    public class ContinentInfo
    {
        public int ContinentID
        {
            get { return _ContinentID; }
            set
            {
                _ContinentID = value;
            }
        }
        private int _ContinentID;

        public string ContinentName
        {
            get { return _ContinentName; }
            set
            {
                _ContinentName = value;
            }
        }
        private string _ContinentName;
    }
    
}