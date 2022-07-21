package main

import (
	_ "github.com/MrSantamaria/osde2e_operator_test/pkg/config"
	"github.com/onsi/ginkgo/v2"
	. "github.com/onsi/ginkgo/v2"
	"github.com/onsi/gomega"
	viper "github.com/openshift/osde2e/pkg/common/concurrentviper"
	osde2eConfig "github.com/openshift/osde2e/pkg/common/config"

	// import suites to be tested
	_ "github.com/MrSantamaria/osde2e_operator_test/pkg/tests/openshift"
	_ "github.com/MrSantamaria/osde2e_operator_test/pkg/tests/operators"
	_ "github.com/MrSantamaria/osde2e_operator_test/pkg/tests/operators/cloudingress"
	_ "github.com/MrSantamaria/osde2e_operator_test/pkg/tests/osd"
	_ "github.com/MrSantamaria/osde2e_operator_test/pkg/tests/scale"
	_ "github.com/MrSantamaria/osde2e_operator_test/pkg/tests/state"
	_ "github.com/MrSantamaria/osde2e_operator_test/pkg/tests/verify"
	_ "github.com/MrSantamaria/osde2e_operator_test/pkg/tests/workloads/guestbook"
	_ "github.com/MrSantamaria/osde2e_operator_test/pkg/tests/workloads/redmine"
)

func main() {
	gomega.RegisterFailHandler(ginkgo.Fail)
	suiteConfig, reporterConfig := GinkgoConfiguration()

	if viper.GetString(osde2eConfig.ReportDir) == "" {
		viper.Set(osde2eConfig.ReportDir, "./out/report/")
	}

	reporterConfig.JUnitReport = "junit.xml"

	RunSpecs(GinkgoT(), "OSD E2E tests", suiteConfig, reporterConfig)
}
