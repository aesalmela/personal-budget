﻿using System;
using System.Collections.Generic;

namespace MyBudget.DAL
{
    public partial class ViewIncomeTotals
    {
        public int YearId { get; set; }
        public int MonthId { get; set; }
        public decimal? Income { get; set; }
    }
}
