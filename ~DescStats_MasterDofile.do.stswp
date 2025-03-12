   * ******************************************************************** *
   * ******************************************************************** *
   *                                                                      *
   *               your_round_name                                        *
   *               MASTER DO_FILE                                         *
   *                                                                      *
   * ******************************************************************** *
   * ******************************************************************** *

       /*
       ** PURPOSE:      Write intro to survey round here

       ** OUTLINE:      PART 0: Standardize settings and install packages
                        PART 1: Prepare folder path globals
                        PART 2: Run the master dofiles for each high-level task

       ** IDS VAR:      list_ID_var_here         //Uniquely identifies households (update for your project)

       ** NOTES:

       ** WRITTEN BY:   names_of_contributors

       ** Last date modified:  9 Oct 2024
       */

*iefolder*0*StandardSettings****************************************************
*iefolder will not work properly if the line above is edited

   * ******************************************************************** *
   *
   *       PART 0:  INSTALL PACKAGES AND STANDARDIZE SETTINGS
   *
   *           - Install packages needed to run all dofiles called
   *            by this master dofile.
   *           - Use ieboilstart to harmonize settings across users
   *
   * ******************************************************************** *

*iefolder*0*End_StandardSettings************************************************
*iefolder will not work properly if the line above is edited

   *Install all packages that this project requires:
   *(Note that this never updates outdated versions of already installed commands, to update commands use adoupdate)
   local user_commands ietoolkit iefieldkit winsor sumstats estout keeporder grc1leg2 iebaltab randtreat 
   //Fill this list will all user-written commands this project requires
   foreach command of local user_commands {
       cap which `command'
       if _rc == 111 {
           ssc install `command'
       }
   }

   *Standardize settings accross users
   ieboilstart, version(12.1)          //Set the version number to the oldest version used by anyone in the project team
   `r(version)'                        //This line is needed to actually set the version from the command above

*iefolder*1*FolderGlobals*******************************************************
*iefolder will not work properly if the line above is edited

   * ******************************************************************** *
   *
   *       PART 1:  PREPARING FOLDER PATH GLOBALS
   *
   *           - Set the global box to point to the project folder
   *            on each collaborator's computer.
   *           - Set other locals that point to other folders of interest.
   *
   * ******************************************************************** *

   * Users
   * -----------

   *User Number:
   * Rohini                     1    // Replace "You" with your name
   * Next User               2    // Assign a user number to each additional collaborator of this code

   *Set this value to the user currently using this file
   global user  1

   * Root folder globals
   * ---------------------

   if "`c(hostname)'" == "PCACL-BTL4WH3" { // RI
		global github 	"C:\WBG\github\peer-code-review-2025" //
		global projectfolder "C:\Users\wb596077\OneDrive - WBG\pcr2025" // 
    }
	
	if "`c(hostname)'" == "xxx" { // Ved - please add your paths here
		global github 	"C:\WBG\github\peer-code-review-2025" //
		global projectfolder "C:\Users\wbxxxxxx\OneDrive - WBG\pcr2025" // 
    }
   
* These lines are used to test that the name is not already used (do not edit manually)

   * Project folder globals
   * ---------------------

   global dataWork         "$projectfolder/Data"

*iefolder*1*FolderGlobals*DescStats*********************************************
*iefolder will not work properly if the line above is edited

   *Encrypted round sub-folder globals
   global Output              "$projectfolder/Output" 

   *DataSets sub-folder globals
   global DescStats_dtDeID       "$dataWork/Deidentified" 
   global DescStats_dtInt        "$dataWork/Intermediate" 
   global DescStats_dtFin        "$dataWork/Final" 

   *Dofile sub-folder globals
   global DescStats_do           "$github/Dofiles" 
   *global DescStats_doCln        "$DescStats_do/Cleaning" 
   *global DescStats_doCon        "$DescStats_do/Construct" 
   *global DescStats_doAnl        "$DescStats_do/Analysis"

   *Output sub-folder globals
   global DescStats_outInt       "$Output/Intermediate" 
   global DescStats_outFin       "$Output/Final" 

   /*Questionnaire sub-folder globals
   global DescStats_prld         "$DescStats_quest/PreloadData" 
   global DescStats_doc          "$DescStats_quest/Questionnaire Documentation"*/

*iefolder*1*End_FolderGlobals***************************************************
*iefolder will not work properly if the line above is edited


*iefolder*2*StandardGlobals*****************************************************
*iefolder will not work properly if the line above is edited

   * Set all non-folder path globals that are constant accross
   * the project. Examples are conversion rates used in unit
   * standardization, different sets of control variables,
   * adofile paths etc.

   * do "$dataWorkFolder/global_setup.do" 


*iefolder*2*End_StandardGlobals*************************************************
*iefolder will not work properly if the line above is edited


*iefolder*3*RunDofiles**********************************************************
*iefolder will not work properly if the line above is edited

   * ******************************************************************** *
   *
   *       PART 3: - RUN DOFILES CALLED BY THIS MASTER DOFILE
   *
   *           - A task master dofile has been created for each high-
   *            level task (cleaning, construct, analysis). By 
   *            running all of them all data work associated with the 
   *            DescStats should be replicated, including output of 
   *            tables, graphs, etc.
   *           - Feel free to add to this list if you have other high-
   *            level tasks relevant to your project.
   *
   * ******************************************************************** *

   **Set the locals corresponding to the tasks you want
   * run to 1. To not run a task, set the local to 0.
   local processDo       1
   local constructDo     1
   local summaryDo       1

   if (`processDo' == 1) { // Change the local above to run or not to run this file
       do "$DescStats_do/01-processing.do" 
   }

   if (`constructDo' == 1) { // Change the local above to run or not to run this file
       do "$DescStats_do/02-constructing.do" 
   }

   if (`summaryDo' == 1) { // Change the local above to run or not to run this file
       do "$DescStats_do/03-summary-statistics.do" 
   }
   
*iefolder*3*End_RunDofiles******************************************************
*iefolder will not work properly if the line above is edited

