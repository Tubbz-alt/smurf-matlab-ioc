program ChangeLogger

/* Mike Zelazny (zelazny@stanford.edu) */

%%#include <string.h>      /* sprintf prototype */
%%#include <errlog.h>      /* errlogPrintf */

option +c;  /* All connections must be made before execution begins */
option +d;  /* Turn on runtime debug messages */
option +r;  /* All declarations private to this sequence */
option -a;  /* All pvGets must be synchronous */

float PREV_VAL;
string PREV_VAL_S;

float VAL;
assign VAL to "{pv}";
monitor VAL;
evflag VAL_ef;
sync VAL VAL_ef;

string VAL_S;
assign VAL_S to "{pv}";

string NAME;
assign NAME to "{pv}.NAME";

string DESC;
assign DESC to "{pv}.DESC";
monitor DESC;

string EGU;
assign EGU to "{pv}.EGU";
monitor EGU;

entry {
  pvGet(VAL);
  pvGet(VAL_S);
  pvGet(NAME);
  pvGet(DESC);
  pvGet(EGU);
  efClear (VAL_ef);
  PREV_VAL = VAL;
  sprintf (PREV_VAL_S, "%s", VAL_S);
  errlogPrintf ("%s `%s' logging enabled, initial value is %s %s\n", NAME, DESC, PREV_VAL_S, EGU);
  }

ss ChangeLoggerss {

  state checking {

    when (efTest (VAL_ef)) {

      efClear (VAL_ef);

      } state logging

    } /* state checking */

  state logging {

    when (1) {

      if (PREV_VAL != VAL) { 

        pvGet(VAL_S);
        errlogPrintf ("%s changed from %s %s to %s %s\n", DESC, PREV_VAL_S, EGU, VAL_S, EGU);
        PREV_VAL = VAL;
        sprintf (PREV_VAL_S, "%s", VAL_S);

        }  /* value actually changed */

      } state checking

    } /* state logging */

} /* ChangeLoggerss */
