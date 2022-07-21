package main

import (
	"github.com/onsi/ginkgo/v2"
	. "github.com/onsi/ginkgo/v2"
	"github.com/onsi/gomega"
	"github.com/openshift/osde2e/pkg/common/alert"
	viper "github.com/openshift/osde2e/pkg/common/concurrentviper"
	osde2eConfig "github.com/openshift/osde2e/pkg/common/config"

	// import suites to be tested
	_ "github.com/MrSantamaria/osde2e_operator_test/pkg/tests"
)

func main() {
	//Here all the configs that are loaded from the environment variables, flags, etc are loaded.
	osde2eConfig.InitViper()
	//LoadKubeconfig will, given a path to a kubeconfig, attempt to load it into the Viper config.
	osde2eConfig.LoadKubeconfig()

	alert.RegisterGinkgoAlert("[Suite: operators] [OSD] Managed Velero Operator", "SD-SREP", "@managed-velero-operator", "sd-cicd-alerts", "sd-cicd@redhat.com", 4)

	gomega.RegisterFailHandler(ginkgo.Fail)
	suiteConfig, reporterConfig := GinkgoConfiguration()

	if viper.GetString(osde2eConfig.ReportDir) == "" {
		viper.Set(osde2eConfig.ReportDir, "./out/report/")
	}

	reporterConfig.JUnitReport = "junit.xml"

	RunSpecs(GinkgoT(), "OSD E2E tests", suiteConfig, reporterConfig)
}
