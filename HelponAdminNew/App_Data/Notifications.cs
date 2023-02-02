using Microsoft.VisualBasic;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;

public class Notifications
{
    public static string ErrorMessageBlock(string Msg)
    {
        return "<div class='alert alert-danger col-sm-12'><strong><a href='#' class='close' data-dismiss='alert' aria-label='close' >x</a> Error! </strong>" + Msg + "</div>";
    }
    public static string ErrorMessage(string Msg)
    {
        return "<div class='alert alert-danger col-sm-12'><strong><a href='#' class='close' data-dismiss='alert' aria-label='close' >x</a> Error! </strong>" + Msg + "</div>";

    }
    public static string WarningMessage(string Msg)
    {
        return "<div class='alert alert-warning col-sm-12'><strong><a href='#' class='close' data-dismiss='alert' aria-label='close' >x</a> Warning! </strong>" + Msg + "</div>";
    }
    public static string SuccessMessage(string Msg)
    {
        return "<div class='alert alert-success col-sm-12'><strong><a href='#' class='close' data-dismiss='alert' aria-label='close' onclick='clearnotification()' >x</a> Success! </strong>" + Msg + "</div>";
    }
    public static string InfoMessage(string Msg)
    {
        return "<div class='alert alert-info col-sm-12'><strong><a href='#' class='close' data-dismiss='alert' aria-label='close' >x</a> info! </strong>" + Msg + "</div>";
    }
}

