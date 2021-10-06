@rem
@rem Copyright 2015 the original author or authors.
@rem
@rem Licensed under the Apache License, Version 2.0 (the "License");
@rem you may not use this file except in compliance with the License.
@rem You may obtain a copy of the License at
@rem
@rem      https://www.apache.org/licenses/LICENSE-2.0
@rem
@rem Unless required by applicable law or agreed to in writing, software
@rem distributed under the License is distributed on an "AS IS" BASIS,
@rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@rem See the License for the specific language governing permissions and
@rem limitations under the License.
@rem

@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  flywayjar startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Resolve any "." and ".." in APP_HOME to make it shorter.
for %%i in ("%APP_HOME%") do set APP_HOME=%%~fi

@rem Add default JVM options here. You can also use JAVA_OPTS and FLYWAYJAR_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto execute

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto execute

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\flywayjar-1.0.0.jar;%APP_HOME%\lib\flyway-core-7.13.0.jar;%APP_HOME%\lib\redshift-jdbc42-2.0.0.7.jar;%APP_HOME%\lib\aws-lambda-java-log4j2-1.2.0.jar;%APP_HOME%\lib\aws-lambda-java-core-1.2.1.jar;%APP_HOME%\lib\aws-lambda-java-events-3.1.0.jar;%APP_HOME%\lib\aws-java-sdk-s3-1.12.45.jar;%APP_HOME%\lib\gson-2.8.7.jar;%APP_HOME%\lib\aws-java-sdk-secretsmanager-1.12.53.jar;%APP_HOME%\lib\log4j-slf4j18-impl-2.13.0.jar;%APP_HOME%\lib\slf4j-api-2.0.0-alpha4.jar;%APP_HOME%\lib\log4j-core-2.13.2.jar;%APP_HOME%\lib\postgresql-42.2.14.jar;%APP_HOME%\lib\ngdbc-2.9.16.jar;%APP_HOME%\lib\mysql-connector-java-8.0.26.jar;%APP_HOME%\lib\aws-java-sdk-kms-1.12.45.jar;%APP_HOME%\lib\aws-java-sdk-core-1.12.53.jar;%APP_HOME%\lib\joda-time-2.8.1.jar;%APP_HOME%\lib\jmespath-java-1.12.53.jar;%APP_HOME%\lib\log4j-api-2.13.2.jar;%APP_HOME%\lib\protobuf-java-3.11.4.jar;%APP_HOME%\lib\httpclient-4.5.13.jar;%APP_HOME%\lib\commons-logging-1.2.jar;%APP_HOME%\lib\commons-codec-1.15.jar;%APP_HOME%\lib\ion-java-1.0.2.jar;%APP_HOME%\lib\jackson-annotations-2.12.3.jar;%APP_HOME%\lib\jackson-core-2.12.3.jar;%APP_HOME%\lib\jackson-dataformat-cbor-2.12.3.jar;%APP_HOME%\lib\jackson-databind-2.12.3.jar;%APP_HOME%\lib\httpcore-4.4.13.jar


@rem Execute flywayjar
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %FLYWAYJAR_OPTS%  -classpath "%CLASSPATH%" flywayjar.Main %*

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable FLYWAYJAR_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%FLYWAYJAR_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
