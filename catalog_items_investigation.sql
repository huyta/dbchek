-- 1. Get CatalogItems details and associated Processor info
SELECT 
    ci.Id AS CatalogItemId, 
    ci.Name AS CatalogItemName, 
    ci.ShortName,
    ci.ProcessorId, 
    p.Name AS ProcessorName,
    ci.Section,
    ci.*
FROM catalogitems ci
LEFT JOIN processors p ON ci.ProcessorId = p.Id
WHERE ci.Id IN (19820000, 2480, 2483, 2486, 2489, 2492, 2495, 2498);

-- 2. Get Parameters associated with these CatalogItems
SELECT 
    cip.CatalogItemId,
    ci.Name AS CatalogItemName,
    p.Id AS ParameterId,
    p.Name AS ParameterName,
    p.Code AS ParameterCode,
    p.MeasurementUnitId,
    p.AcceptableValueTypeId,
    cip.DisplayOrder,
    cip.IsMandatory,
    p.*
FROM parameters p
JOIN catalogitemparameters cip ON p.Id = cip.ParameterId
JOIN catalogitems ci ON cip.CatalogItemId = ci.Id
WHERE cip.CatalogItemId IN (19820000, 2480, 2483, 2486, 2489, 2492, 2495, 2498)
ORDER BY cip.CatalogItemId, cip.DisplayOrder;

-- 3. Get ParameterReferences (Reference Ranges etc) for the Parameters of these CatalogItems
SELECT 
    cip.CatalogItemId,
    pr.ParameterId,
    p.Name AS ParameterName,
    pr.GenderId,
    pr.AgeFrom,
    pr.AgeTo,
    pr.LowerValue,
    pr.UpperValue,
    pr.CriticalLow,
    pr.CriticalHigh,
    pr.*
FROM parameterreferences pr
JOIN parameters p ON pr.ParameterId = p.Id
JOIN catalogitemparameters cip ON p.Id = cip.ParameterId
WHERE cip.CatalogItemId IN (19820000, 2480, 2483, 2486, 2489, 2492, 2495, 2498)
ORDER BY cip.CatalogItemId, pr.ParameterId;

-- 4. Get ParameterSelectValues (Dropdown options) for the Parameters of these CatalogItems
SELECT 
    cip.CatalogItemId,
    psv.ParameterId,
    p.Name AS ParameterName,
    psv.Name AS SelectValueName,
    psv.Value AS SelectValue,
    psv.Sequence,
    psv.*
FROM parameterselectvalues psv
JOIN parameters p ON psv.ParameterId = p.Id
JOIN catalogitemparameters cip ON p.Id = cip.ParameterId
WHERE cip.CatalogItemId IN (19820000, 2480, 2483, 2486, 2489, 2492, 2495, 2498)
ORDER BY cip.CatalogItemId, psv.ParameterId, psv.Sequence;

-- 5. Get TemplateParameters information for the Parameters of these CatalogItems
-- Note: This shows if these parameters are part of any templates.
SELECT 
    cip.CatalogItemId,
    tp.TemplateId,
    tp.ParameterId,
    p.Name AS ParameterName,
    tp.Serial,
    tp.*
FROM templateparameters tp
JOIN parameters p ON tp.ParameterId = p.Id
JOIN catalogitemparameters cip ON p.Id = cip.ParameterId
WHERE cip.CatalogItemId IN (19820000, 2480, 2483, 2486, 2489, 2492, 2495, 2498);

-- 6. Get Processors details for these CatalogItems (Distinct list)
SELECT DISTINCT
    p.Id AS ProcessorId,
    p.Name AS ProcessorName,
    p.Description,
    p.IsInternal,
    p.*
FROM processors p
JOIN catalogitems ci ON p.Id = ci.ProcessorId
WHERE ci.Id IN (19820000, 2480, 2483, 2486, 2489, 2492, 2495, 2498);
