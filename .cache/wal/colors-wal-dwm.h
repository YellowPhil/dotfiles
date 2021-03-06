static const char norm_fg[] = "#bedfd5";
static const char norm_bg[] = "#090B14";
static const char norm_border[] = "#859c95";

static const char sel_fg[] = "#bedfd5";
static const char sel_bg[] = "#19526A";
static const char sel_border[] = "#bedfd5";

static const char urg_fg[] = "#bedfd5";
static const char urg_bg[] = "#224D4E";
static const char urg_border[] = "#224D4E";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
