USE PortfolioProjects;

-- Cleaning Data 
SELECT * FROM [dbo].[Nashville_Housing_Data]

-- Standardize Date Format
SELECT SaleDateConverted, CONVERT(Date, SaleDate)
FROM [dbo].[Nashville_Housing_Data]

UPDATE Nashville_Housing_Data
SET SaleDate = CONVERT(Date, SaleDate)

ALTER TABLE Nashville_Housing_Data
ADD SaleDateConverted Date;

UPDATE Nashville_Housing_Data
SET SaleDateConverted = CONVERT(Date, SaleDate)

-------------

-- Populate Property Address Data

SELECT *
FROM [dbo].[Nashville_Housing_Data]
-- WHERE PropertyAddress IS NULL
ORDER BY ParcelID


SELECT a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, ISNULL(a.PropertyAddress, b.PropertyAddress)
FROM [dbo].[Nashville_Housing_Data] a
JOIN [dbo].[Nashville_Housing_Data] b
    ON a.ParcelID = b.ParcelID
    AND a.[UniqueID] != b.[UniqueID]
WHERE a.PropertyAddress IS NULL

UPDATE a
SET PropertyAddress = ISNULL(a.PropertyAddress, b.PropertyAddress)
FROM [dbo].[Nashville_Housing_Data] a
JOIN [dbo].[Nashville_Housing_Data] b
    ON a.ParcelID = b.ParcelID
    AND a.[UniqueID] != b.[UniqueID]
WHERE a.PropertyAddress IS NULL 

------------------
-- Breaking out Address into Individual Columns (Address, City, State)


SELECT PropertyAddress
FROM [dbo].[Nashville_Housing_Data]
--WHERE PropertyAddress is null
--ORDER BY ParcelID

SELECT
SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1 ) as Address
, SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) + 1 , LEN(PropertyAddress)) as Address

FROM [dbo].[Nashville_Housing_Data]


ALTER TABLE Nashville_Housing_Data
ADD PropertySplitAddress Nvarchar(255);

UPDATE Nashville_Housing_Data
SET PropertySplitAddress = SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1 )

ALTER TABLE Nashville_Housing_Data
ADD PropertySplitCity Nvarchar(255);

UPDATE Nashville_Housing_Data
SET PropertySplitCity = SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) + 1 , LEN(PropertyAddress))



SELECT *
FROM [dbo].[Nashville_Housing_Data]


SELECT OwnerAddress
FROM [dbo].[Nashville_Housing_Data]


SELECT
PARSENAME(REPLACE(OwnerAddress, ',', '.') , 3)
,PARSENAME(REPLACE(OwnerAddress, ',', '.') , 2)
,PARSENAME(REPLACE(OwnerAddress, ',', '.') , 1)
FROM [dbo].[Nashville_Housing_Data]

ALTER TABLE Nashville_Housing_Data
ADD OwnerSplitAddress Nvarchar(255);

UPDATE Nashville_Housing_Data
SET OwnerSplitAddress = PARSENAME(REPLACE(OwnerAddress, ',', '.') , 3)


ALTER TABLE Nashville_Housing_Data
ADD OwnerSplitCity Nvarchar(255);

UPDATE Nashville_Housing_Data
SET OwnerSplitCity = PARSENAME(REPLACE(OwnerAddress, ',', '.') , 2)


ALTER TABLE Nashville_Housing_Data
ADD OwnerSplitState Nvarchar(255);

UPDATE Nashville_Housing_Data
SET OwnerSplitState = PARSENAME(REPLACE(OwnerAddress, ',', '.') , 1)



Select *
From [dbo].[Nashville_Housing_Data]


-----------------------------------------------

-- Change Y and N to Yes and No in "Sold as Vacant" field


SELECT DISTINCT(SoldAsVacant), Count(SoldAsVacant)
FROM [dbo].[Nashville_Housing_Data]
GROUP BY SoldAsVacant
ORDER BY 2




SELECT SoldAsVacant
, CASE WHEN SoldAsVacant = 'Y' THEN 'Yes'
	   WHEN SoldAsVacant = 'N' THEN 'No'
	   ELSE SoldAsVacant
	   END
FROM [dbo].[Nashville_Housing_Data]


UPDATE Nashville_Housing_Data
SET SoldAsVacant = CASE When SoldAsVacant = 'Y' THEN 'Yes'
	   When SoldAsVacant = 'N' THEN 'No'
	   ELSE SoldAsVacant
	   END

------------------------------------
-- Remove Duplicates

;WITH RowNumCTE AS(
SELECT *,
	ROW_NUMBER() OVER (
	PARTITION BY ParcelID,
				 PropertyAddress,
				 SalePrice,
				 SaleDate,
				 LegalReference
				 ORDER BY
					UniqueID
					) row_num

FROM [dbo].[Nashville_Housing_Data]
--ORDER BY ParcelID
)
SELECT *
FROM RowNumCTE
WHERE row_num > 1
ORDER BY PropertyAddress


SELECT *
FROM [dbo].[Nashville_Housing_Data]

--------------------------------------------

-- Delete Unused Columns



SELECT *
FROM [dbo].[Nashville_Housing_Data]


ALTER TABLE [dbo].[Nashville_Housing_Data]
DROP COLUMN OwnerAddress, TaxDistrict, PropertyAddress, SaleDate

