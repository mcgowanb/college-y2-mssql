//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace proc_test
{
    using System;
    using System.Collections.Generic;
    
    public partial class transaction_tbl
    {
        public int TransactionID { get; set; }
        public Nullable<int> WalletID { get; set; }
        public Nullable<decimal> Amount { get; set; }
        public Nullable<System.DateTime> TransactionDate { get; set; }
        public Nullable<int> TransactionTypeID { get; set; }
    
        public virtual transaction_type_tbl transaction_type_tbl { get; set; }
        public virtual wallet_tbl wallet_tbl { get; set; }
    }
}