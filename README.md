Adds an additional box in patient dashboard to quickly enroll in programs
and change states for selected programs and states

Build instructions:
1. Check out openmrs-1.7.x
2. Reconfigure openmrs-1.7.x to export all project libraries to dependent projects
3. Run ../openmrs-1.7.x/build.xml to create openmrs-1.7.x packages
4. Check out programlocation
5. Run ../programlocation/build.xml to create programlocation.omod
6. Run ./build.xml to create quickprograms.omod
