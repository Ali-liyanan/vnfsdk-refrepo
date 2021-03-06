/**
 * Copyright 2017 Huawei Technologies Co., Ltd.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.onap.vnfsdk.marketplace.onboarding.hooks.validatelifecycle;

import java.util.List;

public class LifeCycleTestReq {
	
	// VNF package Id
	private String csarId;
	
	// VIM (lab-static) Id on which VNFs are located
	private String labVimId;
	
	// Dynamic VIM Ids
	private List<String> vimIds;

	public String getCsarId() {
		return csarId;
	}

	public void setCsarId(String csarId) {
		this.csarId = csarId;
	}

	public String getLabVimId() {
		return labVimId;
	}

	public void setLabVimId(String labVimId) {
		this.labVimId = labVimId;
	}

	public List<String> getVimIds() {
		return vimIds;
	}

	public void setVimIds(List<String> vimIds) {
		this.vimIds = vimIds;
	}
}
