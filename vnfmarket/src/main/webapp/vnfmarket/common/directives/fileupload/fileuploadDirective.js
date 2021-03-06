/*
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
(function () {
    'use strict';

    /**
     * @ngdoc function
     * @name app.controller:fileuploadDirective
     * @description
     * # fileuploadDirective
     * Directive of the app
     */

    angular
        .module('vnfmarket')
        .directive('fileUpload', fileUpload);

    function fileUpload() {

        var directive = {
            link: link,
            restrict: 'EA',
            scope: {
                fileUpload: "="
            },
        }

        return directive;

        function link(scope, element, attrs) {
            element.bind("change", function (changeEvent) {
                scope.$apply(function () {
                    var fileType = changeEvent.target.accept;
                    var ext = "." + changeEvent.target.value.match(/\.(.+)$/)[1];
                    scope.fileUpload = null;
                    if (typeof fileType == undefined || fileType == "") {
                        scope.fileUpload = changeEvent.target.files[0];
                    }
                    else if ((Array.isArray(fileType) && fileType.indexOf(ext) > -1) || (fileType == ext)) {
                        scope.fileUpload = changeEvent.target.files[0];
                    }
                });
            });
        }
    }
})();