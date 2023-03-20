package main

crd: {
	name: "airbyte-crd"
	type: "k8s-objects"
	properties: objects: [{
		"apiVersion": "apiextensions.k8s.io/v1"
		"kind":       "CustomResourceDefinition"
		"metadata": {
			"name": "connectordefinitions.airbyte.pravaah.dev"
		}
		"spec": {
			"group": "airbyte.pravaah.dev"
			"names": {
				"categories": []
				"kind":   "ConnectorDefinition"
				"plural": "connectordefinitions"
				"shortNames": [
					"cd",
				]
				"singular": "connectordefinition"
			}
			"scope": "Namespaced"
			"versions": [
				{
					"additionalPrinterColumns": []
					"name": "v1alpha1"
					"schema": {
						"openAPIV3Schema": {
							"description": "Auto-generated derived type for ConnectorDefinitionSpec via `CustomResource`"
							"properties": {
								"spec": {
									"description": "Specification of a connector (source/destination) definition"
									"properties": {
										"id": {
											"type": "string"
										}
										"imageRepository": {
											"type": "string"
										}
										"imageTag": {
											"type": "string"
										}
										"kind": {
											"type": "string"
										}
										"name": {
											"type": "string"
										}
										"spec": {
											"properties": {
												"changelogUrl": {
													"nullable": true
													"type":     "string"
												}
												"connectionSpecification": {
													"nullable":                             true
													"type":                                 "object"
													"x-kubernetes-embedded-resource":       true
													"x-kubernetes-preserve-unknown-fields": true
												}
												"documentationUrl": {
													"nullable": true
													"type":     "string"
												}
												"protocolVersion": {
													"description": "the Airbyte Protocol version supported by the connector. Protocol versioning uses SemVer."
													"nullable":    true
													"type":        "string"
												}
												"supportedDestinationSyncModes": {
													"description": "List of destination sync modes supported by the connector"
													"items": {
														"enum": [
															"append",
															"overwrite",
															"append_dedup",
														]
														"type": "string"
													}
													"type": "array"
												}
												"supportsDBT": {
													"default":     false
													"description": "If the connector supports DBT or not."
													"type":        "boolean"
												}
												"supportsIncremental": {
													"description": "(deprecated) If the connector supports incremental mode or not."
													"nullable":    true
													"type":        "boolean"
												}
												"supportsNormalization": {
													"default":     false
													"description": "If the connector supports normalization or not."
													"type":        "boolean"
												}
											}
											"required": [
												"connectionSpecification",
											]
											"type": "object"
										}
									}
									"required": [
										"id",
										"imageRepository",
										"imageTag",
										"kind",
										"name",
										"spec",
									]
									"type": "object"
								}
								"status": {
									"nullable": true
									"properties": {
										"state": {
											"type": "string"
										}
									}
									"required": [
										"state",
									]
									"type": "object"
								}
							}
							"required": [
								"spec",
							]
							"title": "ConnectorDefinition"
							"type":  "object"
						}
					}
					"served":  true
					"storage": true
					"subresources": {
						"status": {}
					}
				},
			]
		}
	}, {
		"apiVersion": "apiextensions.k8s.io/v1"
		"kind":       "CustomResourceDefinition"
		"metadata": {
			"name": "connectors.airbyte.pravaah.dev"
		}
		"spec": {
			"group": "airbyte.pravaah.dev"
			"names": {
				"categories": []
				"kind":   "Connector"
				"plural": "connectors"
				"shortNames": [
					"cntr",
				]
				"singular": "connector"
			}
			"scope": "Namespaced"
			"versions": [
				{
					"additionalPrinterColumns": []
					"name": "v1alpha1"
					"schema": {
						"openAPIV3Schema": {
							"description": "Auto-generated derived type for ConnectorSpec via `CustomResource`"
							"properties": {
								"spec": {
									"description": "Specification of a connector (source/destination)"
									"properties": {
										"connectorDefinitionRef": {
											"properties": {
												"name": {
													"type": "string"
												}
												"namespace": {
													"nullable": true
													"type":     "string"
												}
											}
											"required": [
												"name",
											]
											"type": "object"
										}
										"spec": {
											"nullable":                             true
											"type":                                 "object"
											"x-kubernetes-embedded-resource":       true
											"x-kubernetes-preserve-unknown-fields": true
										}
									}
									"required": [
										"connectorDefinitionRef",
										"spec",
									]
									"type": "object"
								}
								"status": {
									"nullable": true
									"properties": {
										"state": {
											"type": "string"
										}
									}
									"required": [
										"state",
									]
									"type": "object"
								}
							}
							"required": [
								"spec",
							]
							"title": "Connector"
							"type":  "object"
						}
					}
					"served":  true
					"storage": true
					"subresources": {
						"status": {}
					}
				},
			]
		}
	}, {
		"apiVersion": "apiextensions.k8s.io/v1"
		"kind":       "CustomResourceDefinition"
		"metadata": {
			"name": "connections.airbyte.pravaah.dev"
		}
		"spec": {
			"group": "airbyte.pravaah.dev"
			"names": {
				"categories": []
				"kind":   "Connection"
				"plural": "connections"
				"shortNames": [
					"cn",
				]
				"singular": "connection"
			}
			"scope": "Namespaced"
			"versions": [
				{
					"additionalPrinterColumns": []
					"name": "v1alpha1"
					"schema": {
						"openAPIV3Schema": {
							"description": "Auto-generated derived type for ConnectionSpec via `CustomResource`"
							"properties": {
								"spec": {
									"description": "Specification of a connection (source/destination/catalog)"
									"properties": {
										"catalog": {
											"description": "Airbyte stream schema catalog"
											"properties": {
												"streams": {
													"items": {
														"properties": {
															"cursor_field": {
																"description": "Path to the field that will be used to determine if a record is new or modified since the last sync. This field is REQUIRED if `sync_mode` is `incremental`. Otherwise it is ignored."
																"items": {
																	"type": "string"
																}
																"type": "array"
															}
															"destination_sync_mode": {
																"enum": [
																	"append",
																	"overwrite",
																	"append_dedup",
																]
																"type": "string"
															}
															"primary_key": {
																"description": "Paths to the fields that will be used as primary key. This field is REQUIRED if `destination_sync_mode` is `*_dedup`. Otherwise it is ignored."
																"items": {
																	"items": {
																		"type": "string"
																	}
																	"type": "array"
																}
																"type": "array"
															}
															"stream": {
																"properties": {
																	"default_cursor_field": {
																		"description": "Path to the field that will be used to determine if a record is new or modified since the last sync. If not provided by the source, the end user will have to specify the comparable themselves."
																		"items": {
																			"type": "string"
																		}
																		"type": "array"
																	}
																	"json_schema": {
																		"nullable":                             true
																		"type":                                 "object"
																		"x-kubernetes-embedded-resource":       true
																		"x-kubernetes-preserve-unknown-fields": true
																	}
																	"name": {
																		"description": "Stream's name."
																		"type":        "string"
																	}
																	"namespace": {
																		"description": "Optional Source-defined namespace. Currently only used by JDBC destinations to determine what schema to write to. Airbyte streams from the same sources should have the same namespace."
																		"nullable":    true
																		"type":        "string"
																	}
																	"source_defined_cursor": {
																		"description": "If the source defines the cursor field, then any other cursor field inputs will be ignored. If it does not, either the user_provided one is used, or the default one is used as a backup."
																		"nullable":    true
																		"type":        "boolean"
																	}
																	"source_defined_primary_key": {
																		"description": "If the source defines the primary key, paths to the fields that will be used as a primary key. If not provided by the source, the end user will have to specify the primary key themselves."
																		"items": {
																			"items": {
																				"type": "string"
																			}
																			"type": "array"
																		}
																		"type": "array"
																	}
																	"supported_sync_modes": {
																		"description": "List of sync modes supported by this stream."
																		"items": {
																			"enum": [
																				"full_refresh",
																				"incremental",
																			]
																			"type": "string"
																		}
																		"type": "array"
																	}
																}
																"required": [
																	"json_schema",
																	"name",
																	"supported_sync_modes",
																]
																"type": "object"
															}
															"sync_mode": {
																"enum": [
																	"full_refresh",
																	"incremental",
																]
																"type": "string"
															}
														}
														"required": [
															"destination_sync_mode",
															"stream",
															"sync_mode",
														]
														"type": "object"
													}
													"type": "array"
												}
											}
											"required": [
												"streams",
											]
											"type": "object"
										}
										"destinationRef": {
											"properties": {
												"name": {
													"type": "string"
												}
												"namespace": {
													"nullable": true
													"type":     "string"
												}
											}
											"required": [
												"name",
											]
											"type": "object"
										}
										"schedule": {
											"properties": {
												"timeUnit": {
													"enum": [
														"minutes",
														"hours",
														"days",
														"weeks",
														"months",
													]
													"type": "string"
												}
												"units": {
													"format":  "uint64"
													"minimum": 0
													"type":    "integer"
												}
											}
											"required": [
												"timeUnit",
												"units",
											]
											"type": "object"
										}
										"scheduleType": {
											"enum": [
												"manual",
												"cron",
											]
											"type": "string"
										}
										"sourceRef": {
											"properties": {
												"name": {
													"type": "string"
												}
												"namespace": {
													"nullable": true
													"type":     "string"
												}
											}
											"required": [
												"name",
											]
											"type": "object"
										}
									}
									"required": [
										"catalog",
										"destinationRef",
										"schedule",
										"scheduleType",
										"sourceRef",
									]
									"type": "object"
								}
								"status": {
									"nullable": true
									"properties": {
										"lastReplication": {
											"nullable": true
											"properties": {
												"name": {
													"type": "string"
												}
												"namespace": {
													"nullable": true
													"type":     "string"
												}
											}
											"required": [
												"name",
											]
											"type": "object"
										}
										"state": {
											"type": "string"
										}
									}
									"required": [
										"state",
									]
									"type": "object"
								}
							}
							"required": [
								"spec",
							]
							"title": "Connection"
							"type":  "object"
						}
					}
					"served":  true
					"storage": true
					"subresources": {
						"status": {}
					}
				},
			]
		}
	}, {
		"apiVersion": "apiextensions.k8s.io/v1"
		"kind":       "CustomResourceDefinition"
		"metadata": {
			"name": "replications.airbyte.pravaah.dev"
		}
		"spec": {
			"group": "airbyte.pravaah.dev"
			"names": {
				"categories": []
				"kind":   "Replication"
				"plural": "replications"
				"shortNames": [
					"rpln",
				]
				"singular": "replication"
			}
			"scope": "Namespaced"
			"versions": [
				{
					"additionalPrinterColumns": []
					"name": "v1alpha1"
					"schema": {
						"openAPIV3Schema": {
							"description": "Auto-generated derived type for ReplicationSpec via `CustomResource`"
							"properties": {
								"spec": {
									"description": "Replication properties that will be wrapped in a Kubernetes resource as a Spec struct"
									"properties": {
										"connectionRef": {
											"properties": {
												"name": {
													"type": "string"
												}
												"namespace": {
													"nullable": true
													"type":     "string"
												}
											}
											"required": [
												"name",
											]
											"type": "object"
										}
										"name": {
											"type": "string"
										}
										"resourceRequirements": {
											"nullable": true
											"properties": {
												"operation": {
													"nullable": true
													"type":     "string"
												}
												"version": {
													"nullable": true
													"type":     "string"
												}
											}
											"type": "object"
										}
									}
									"required": [
										"connectionRef",
										"name",
									]
									"type": "object"
								}
								"status": {
									"nullable": true
									"properties": {
										"lastJob": {
											"nullable": true
											"properties": {
												"name": {
													"type": "string"
												}
												"namespace": {
													"nullable": true
													"type":     "string"
												}
											}
											"required": [
												"name",
											]
											"type": "object"
										}
										"lastOutput": {
											"nullable": true
											"properties": {
												"name": {
													"type": "string"
												}
												"namespace": {
													"nullable": true
													"type":     "string"
												}
											}
											"required": [
												"name",
											]
											"type": "object"
										}
										"state": {
											"type": "string"
										}
										"status": {
											"nullable": true
											"type":     "string"
										}
									}
									"required": [
										"state",
									]
									"type": "object"
								}
							}
							"required": [
								"spec",
							]
							"title": "Replication"
							"type":  "object"
						}
					}
					"served":  true
					"storage": true
					"subresources": {
						"status": {}
					}
				},
			]
		}
	}, {
		"apiVersion": "apiextensions.k8s.io/v1"
		"kind":       "CustomResourceDefinition"
		"metadata": {
			"name": "replicationoutputs.airbyte.pravaah.dev"
		}
		"spec": {
			"group": "airbyte.pravaah.dev"
			"names": {
				"categories": []
				"kind":   "ReplicationOutput"
				"plural": "replicationoutputs"
				"shortNames": [
					"ropt",
				]
				"singular": "replicationoutput"
			}
			"scope": "Namespaced"
			"versions": [
				{
					"additionalPrinterColumns": []
					"name": "v1alpha1"
					"schema": {
						"openAPIV3Schema": {
							"description": "Auto-generated derived type for ReplicationOutputSpec via `CustomResource`"
							"properties": {
								"spec": {
									"description": "ReplicationSummary properties that will be wrapped in a Kubernetes resource as a Spec struct"
									"properties": {
										"replicationRef": {
											"properties": {
												"name": {
													"type": "string"
												}
												"namespace": {
													"nullable": true
													"type":     "string"
												}
											}
											"required": [
												"name",
											]
											"type": "object"
										}
									}
									"required": [
										"replicationRef",
									]
									"type": "object"
								}
								"status": {
									"nullable": true
									"properties": {
										"state": {
											"nullable":                             true
											"type":                                 "object"
											"x-kubernetes-embedded-resource":       true
											"x-kubernetes-preserve-unknown-fields": true
										}
										"status": {
											"nullable": true
											"type":     "string"
										}
										"summary": {
											"nullable": true
											"properties": {
												"bytesMoved": {
													"format":  "uint64"
													"minimum": 0
													"type":    "integer"
												}
											}
											"required": [
												"bytesMoved",
											]
											"type": "object"
										}
									}
									"required": [
										"state",
									]
									"type": "object"
								}
							}
							"required": [
								"spec",
							]
							"title": "ReplicationOutput"
							"type":  "object"
						}
					}
					"served":  true
					"storage": true
					"subresources": {
						"status": {}
					}
				},
			]
		}
	}]
}
