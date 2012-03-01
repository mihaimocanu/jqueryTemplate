using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace testJquery
{
    public class CountryInfo
    {
        public int CntrID
        {
            get { return _CntrID; }
            set
            {
                _CntrID = value;
            }
        }
        private int _CntrID;

        public string CountryName
        {
            get { return _CountryName; }
            set
            {
                _CountryName = value;
            }
        }
        private string _CountryName;

        public int ContinentID
        {
            get { return _ContinentID; }
            set
            {
                _ContinentID = value;
            }
        }
        private int _ContinentID;
        
    }
}