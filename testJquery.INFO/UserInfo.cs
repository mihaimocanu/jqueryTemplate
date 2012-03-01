using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace testJquery
{
	public class UserInfo
	{
			
		public int UserID
		{
            get { return _UserID; }
			set
			{
                _UserID = value;
			}
		}
        private int _UserID;

		public string UserName
		{
			get { return _UserName; }
			set
			{
				_UserName = value;
			}

		}
		private string _UserName;

        public string UserFirstName
		{
            get { return _UserFirstName; }
			set
			{
                _UserFirstName = value;
			}

		}
        private string _UserFirstName;

        public string UserLastName
		{
            get { return _UserLastName; }
            set { _UserLastName = value; }
		}
        private string _UserLastName;

		//public DateTime DateofBirth
		//{
		//    get { return _DateofBirth; }
		//    set
		//    {
		//        _DateofBirth = value;
		//    }
		//}
		//private DateTime _DateofBirth;

        public string Useremail
		{

            get { return _Useremail; }
            set { _Useremail = value; }
		}
        private string _Useremail;

		//public bool IsModerator
		//{
		//    get { return _IsModerator; }
		//    set { _IsModerator = value; }
		//}
		//private bool _IsModerator;
        public int UsercountryID
        {
            get { return _UsercountryID; }
            set { _UsercountryID = value; }
		}
        private int _UsercountryID;

        public string Userimage
		{
            get { return _Userimage; }
            set { _Userimage = value; }
		}
        private string _Userimage;

		public string UserType
		{
			get { return _UserType; }
			set { _UserType = value; }
		}
		private string _UserType;
	}
}