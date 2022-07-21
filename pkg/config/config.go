package config

import (
	osde2eConfig "github.com/openshift/osde2e/pkg/common/config"
)

func init() {
	osde2eConfig.InitViper()
	osde2eConfig.LoadKubeconfig()
}
