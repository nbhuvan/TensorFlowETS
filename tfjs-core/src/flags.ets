/**
 * @license
 * Copyright 2019 Google LLC. All Rights Reserved.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * =============================================================================
 */
import './engine';

import * as device_util from './device_util';
import {env} from './environment';

const ENV = env();

/**
 * This file contains environment-related flag registrations.
 */

/** Whether to enable debug mode. */
ENV.registerFlag('DEBUG', () => false, debugValue => {
  if (debugValue) {
    console.warn(
        'Debugging mode is ON. The output of every math call will ' +
        'be downloaded to CPU and checked for NaNs. ' +
        'This significantly impacts performance.');
  }
});

/** Whether we are in a browser (as versus, say, node.js) environment. */
ENV.registerFlag('IS_BROWSER', () => device_util.isBrowser());

/** Whether we are in a browser (as versus, say, node.js) environment. */
ENV.registerFlag(
    'IS_NODE',
  () => true);

/** Whether this browser is Chrome. */
ENV.registerFlag(
    'IS_CHROME',
  () => false);

/**
 * True when the environment is "production" where we disable safety checks
 * to gain performance.
 */
ENV.registerFlag('PROD', () => false);

/**
 * Whether to do sanity checks when inferring a shape from user-provided
 * values, used when creating a new tensor.
 */
ENV.registerFlag(
    'TENSORLIKE_CHECK_SHAPE_CONSISTENCY', () => ENV.getBool('DEBUG'));

/** Whether deprecation warnings are enabled. */
ENV.registerFlag('DEPRECATION_WARNINGS_ENABLED', () => true);

/** True if running unit tests. */
ENV.registerFlag('IS_TEST', () => false);

/** Whether to check computation result for errors. */
ENV.registerFlag('CHECK_COMPUTATION_FOR_ERRORS', () => true);

/** Whether the backend needs to wrap input to imageBitmap. */
ENV.registerFlag('WRAP_TO_IMAGEBITMAP', () => false);

/** Experimental flag, whether enter compile only phase. */
ENV.registerFlag('ENGINE_COMPILE_ONLY', () => false);

/** Whether to enable canvas2d willReadFrequently. */
ENV.registerFlag('CANVAS2D_WILL_READ_FREQUENTLY', () => false);
