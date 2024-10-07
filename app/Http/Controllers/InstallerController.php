<?php

namespace App\Http\Controllers;

use Exception;
use Illuminate\Http\Request;
use dacoto\EnvSet\Facades\EnvSet;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Request as RequestFacades;
use dacoto\LaravelWizardInstaller\Controllers\InstallFolderController;
use dacoto\LaravelWizardInstaller\Controllers\InstallServerController;

class InstallerController extends Controller {
    public function purchaseCodeIndex() {
        return view('vendor.installer.steps.purchase-code');
    }


    public function checkPurchaseCode(Request $request) {


            return redirect()->route('install.database');

    }

}

