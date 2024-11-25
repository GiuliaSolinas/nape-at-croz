#!/bin/bash

echo "Cleaning up testing space"

rm -rf nrn*

echo "--- NAPE Collection Test 1 --- "

nape collect start \
    --subject "nrn:procedure:nape-tutorials/tutorial-1:new-employee/empid-10387493" \
    --subject-id 10387493 \
    --procedure-link https://github.com/GiuliaSolinas/nape-catalog.git \ 
    --procedure-directory nape-tutorials/tutorial-1/simple-business-process/new-employee \
    --meta employee-name "Bill Bensing" \
    --meta job-role "Software Engineer"

echo "--- Collect the Background Check Evidence --- "

nape collect evidence \
    --control-activity "criminal-history" \
    --file-path "raw-evidence/background-check.txt"

nape collect evidence \
    --control-activity "document-signatures" \
    --file-path "raw-evidence/hrms-employee-onboarding.json"

echo "--- Execute the Assurance Reporting process based upon evidence collected --- "

nape collect report